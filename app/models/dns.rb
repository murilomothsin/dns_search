class DNS < ApplicationRecord
  validates :ip_address, presence: true
end
