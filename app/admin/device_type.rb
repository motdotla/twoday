ActiveAdmin.register DeviceType do
  permit_params do
    permitted = DeviceType.column_names
    permitted.push(controls_attributes: Control.column_names)
    permitted
  end

  form do |f|
    inputs 'Basics' do
      input :name
    end
    inputs 'Controls' do
      has_many :controls, heading: false, new_record: 'New Control' do |control|
        control.input :name, label: 'Control Name'
        control.input :control_type, label: 'Control Type', as: :select, collection: Control::AVAILABLE_CONTROL_TYPES
      end
    end

    actions
  end
end
