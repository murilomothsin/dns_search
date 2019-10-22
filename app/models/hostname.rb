class Hostname < ApplicationRecord
  validates :hostname, presence: true
  has_many :dns_records
  has_many :dns, through: :dns_records
end
