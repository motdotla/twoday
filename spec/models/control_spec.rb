require 'rails_helper'

RSpec.describe Control, type: :model do
  let(:control) { build_stubbed(:control) }

  it 'requires name' do
    control.name = ''

    expect(control).to_not be_valid
  end

  describe '#select_options' do
    context 'when control_type is select' do
      it 'is required' do
        control.control_type = 'select'
        control.select_options = ''

        expect(control).to_not be_valid
      end
    end

    context 'when control_type is not select' do
      it 'is not required' do
        control.control_type = 'button'
        control.select_options = ''

        expect(control).to be_valid
      end
    end
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
