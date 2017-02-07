require 'rails_helper'

RSpec.describe Device, type: :model do
  let(:device) { build_stubbed(:device) }

  it 'requires name' do
    device.name = ''

    expect(device).to_not be_valid
  end

  it 'requires device_type' do
    device.device_type = nil

    expect(device).to_not be_valid
  end

end
