require 'rails_helper'

RSpec.describe Hostname, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:hostname) }
    # it { should validate_uniqueness_of(:ip_address) }
  end
  describe 'associations' do
    it { should have_many(:dns).class_name('DNS') }
    it { should have_many(:dns_records).class_name('DNSRecord') }
  end
end
