require 'rails_helper'

RSpec.describe Control, type: :model do
  let(:control) { build_stubbed(:control) }

  it 'requires name' do
    control.name = ''

    expect(control).to_not be_valid
  end

  it 'requires device_type' do
    control.device_type = nil

    expect(control).to_not be_valid
  end

  describe '#control_type' do
    it 'is required' do
      control.control_type = ''

      expect(control).to_not be_valid
    end

    it 'must be control_type from the pool of control_types' do
      control.control_type = 'magic_wand'

      expect(control).to_not be_valid
    end
  end
  
end
