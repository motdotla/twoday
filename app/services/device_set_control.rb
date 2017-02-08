class DeviceSetControl
  include ServiceUtilities

  attr_accessor :device
  attr_accessor :field
  attr_accessor :value

  def initialize(device, field, value)
    self.device = device
    self.field = field
    self.value = value
  end

  def run
    device.send("#{field}=", value)

    if call_action_if_it_exists
      device.save
      Success.new(device)
    else
      Error.new('Device expierenced a problem. Please try again.')
    end
  end

  private

  def call_action_if_it_exists
    response = Faraday.send(action_verb, action_url)
    response.success?
  end

  def action_verb
    control.action_verb.downcase
  end

  def action_url
    control.action_url
  end

  # crufty
  def control_id
    field.gsub('control_', '').to_i
  end

  def control
    @control ||= Control.find(control_id)
  end

end
