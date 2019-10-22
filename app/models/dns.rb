class DNS < ApplicationRecord
  validates :ip_address, presence: true
  has_many :dns_records
  has_many :hostnames, through: :dns_records
end
