require 'rails_helper'

RSpec.describe DeviceType, type: :model do
  let(:device_type) { build_stubbed(:device_type) }

  it { expect(device_type).to be_valid }

  it 'requires name' do
    device_type.name = ''

    expect(device_type).to_not be_valid
  end
end
