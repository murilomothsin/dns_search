class DNSRecordsController < ApplicationController
  def index
    included_dns = DNS.lookup(params[:included]).having('COUNT(*) > 1')
    excluded_dns = DNS.lookup(params[:excluded])

    dns_list = DNS
               .select('dns.id, dns.ip_address')
               .where(id: included_dns)
               .where.not(id: excluded_dns)

    hostnames = Hostname
                .select('hostnames.hostname, COUNT(*) as count')
                .joins(:dns_records)
                .where(dns_records: {dns_id: dns_list.ids})
                .where.not(hostname: params[:excluded])
                .where.not(hostname: params[:included])
                .group(:hostname)

    render json: {
      total_records: dns_list.size,
      records: dns_list,
      related_hostnames: hostnames.map { |host|
        { hostname: host.hostname, count: host.count }
      }
    }
  end

  def create
    @dns = DNS.find_or_initialize_by(ip_address: dns_params[:ip_address])
    @dns.hostnames_attributes = dns_params[:hostnames_attributes]
    if @dns.save
      render json: { id: @dns.id }, status: :created
    else
      render json: { errors: @dns.errors },
             status: :unprocessable_entity
    end
  end

  private

  def dns_params
    params.require(:dns_records).permit(
      :ip_address, hostnames_attributes: [:hostname]
    )
  end
end
