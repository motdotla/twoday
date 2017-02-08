module ControlsHelper
  def control_field(f, control)
    field_name = "control_#{control.id}".to_sym

    case control.control_type
    when 'slider'
      f.range_field field_name, min: 0, max: 100, class: 'slider-control'
    when 'select'
      f.select field_name, control.options, {}, { class: 'select-control' }
    when 'button'
      f.button control.name, class: 'button-control'
    else
    end
  end
end
