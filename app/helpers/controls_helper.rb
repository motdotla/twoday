module ControlsHelper
  def control_field(f, control)
    field_name = "control_#{control.id}".to_sym

    case control.control_type
    when 'slider'
      f.text_field field_name, min: 0, max: 100, class: 'slider-control', 'data-type' => 'range'
    when 'select'
      f.select field_name, control.options, {}, { class: 'select-control' }
    when 'button'
      link_to control.name, '#', class: 'ui-btn button-control', id: "device_control_#{control.id}", rel: 'external'
    else
    end
  end
end
