module ControlsHelper
  def control_field(f, control)
    field_name = "control_#{control.id}".to_sym

    case control.control_type
    when 'slider'
      f.range_field field_name, min: 0, max: 100
    when 'select'
      f.select field_name, control.options
    when 'button'
      f.button "IMPLEMENT"
    else
    end
  end
end
