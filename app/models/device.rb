class Device < ActiveRecord::Base
  store_accessor :control_values

  belongs_to :device_type

  validates :name, presence: true
  validates :device_type, presence: true
  validates :ip_address, presence: true

  def method_missing(method_sym, *arguments, &block)
    if control_field_getters.include?(method_sym)
      control_values[method_sym.to_s.gsub('control_', '')]
    elsif control_field_setters.include?(method_sym)
      key = method_sym.to_s.gsub('control_', '').gsub('=', '').to_sym
      control_values[key] = arguments
    else
      super
    end
  end

  private

  def control_field_getters
    device_type.controls.pluck(:id).map { |id| "control_#{id}".to_sym }
  end

  def control_field_setters
    control_field_getters.map { |field| (field.to_s + '=').to_sym }
  end
end
