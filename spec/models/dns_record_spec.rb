require 'rails_helper'

RSpec.describe DNSRecord, type: :model do
  describe 'validations' do
    it { should validate_uniqueness_of(:hostname_id).scoped_to(:dns_id) }
  end
  describe 'associations' do
    it { should belong_to(:hostname).class_name('Hostname') }
    it { should belong_to(:dns).class_name('DNS') }
  end
end
