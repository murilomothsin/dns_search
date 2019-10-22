class DNSRecord < ApplicationRecord
  validates_uniqueness_of :hostname_id, scope: :dns_id

  belongs_to :dns
  belongs_to :hostname
end
