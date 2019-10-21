require 'rails_helper'

RSpec.describe DNS, type: :model do
  it { is_expected.to validate_presence_of(:ip_address) }

end
