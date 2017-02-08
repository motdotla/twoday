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

    if should_make_request? && make_request.success?
      device.save
      Success.new(device)
    elsif !should_make_request?
      device.save
      Success.new(device)
    else
      Error.new("Device expierenced a problem. Please try again. Device status was: #{make_request.status}")
    end
  end

  private

  def make_request
    @make_request ||= Faraday.send(action_verb, action_url)
  end

  def should_make_request?
    action_verb.present? && action_url.present?
  end

  def action_verb
    control.action_verb.try(:downcase)
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
