require 'rails_helper'

RSpec.describe DeviceSetControl do
  let(:device) { create(:device, device_type: device_type) }
  let(:control) { create(:control, device_type: device_type) }
  let(:device_type) { create(:device_type) }
  let(:field_name) { "control_#{control.id}" }

  let(:service) { DeviceSetControl.new(device, field_name, 24) }

  before do
    allow(service).to receive(:call_action_if_it_exists).and_return(true)
  end

  describe '#run' do
    it 'runs successfully' do
      expect(service.run).to be_success
    end

    it 'sets the value' do
      prior_value = device.send(field_name)

      service.run

      new_value = device.reload.send(field_name)

      expect(prior_value).to_not eql(new_value)
    end

    context 'when the device ping fails' do
      it 'raises an error' do
        allow(service).to receive(:call_action_if_it_exists).and_return(false)

        expect(service.run).to_not be_success
      end
    end
  end

end
