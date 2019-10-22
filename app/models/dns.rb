class DNS < ApplicationRecord
  validates :ip_address, presence: true, uniqueness: true
  has_many :dns_records
  has_many :hostnames, through: :dns_records

  accepts_nested_attributes_for :hostnames

  def self.lookup(included)
    DNS
      .select('dns.id')
      .joins(dns_records: :hostname)
      .where(dns_records: { hostnames: { hostname: included } })
      .group('dns.id')
  end
end
