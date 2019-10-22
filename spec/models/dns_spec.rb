require 'rails_helper'

RSpec.describe DNS, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:ip_address) }
    it { should validate_uniqueness_of(:ip_address) }
  end
  describe 'associations' do
    it { should have_many(:hostnames).class_name('Hostname') }
    it { should have_many(:dns_records).class_name('DNSRecord') }
  end
end
