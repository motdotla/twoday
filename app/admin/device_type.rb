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
        control.input :select_options, label: 'Select Options', hint: 'If choosing \'select\' as the control type enter a comma separated list here. For example: Britney Spears, G-Eazy, Elton John'
        control.input :action_verb, label: 'Action Verb', as: :select, collection: Control::AVAILABLE_ACTION_VERBS
        control.input :action_url, label: 'Action URL', as: :string
      end
    end

    actions
  end

  show do |device_type|
    panel 'Basics' do
      attributes_table_for device_type do
        row :name
      end
    end

    device_type.controls.each do |control|
      panel "Control #{control.id}" do
        attributes_table_for "Control #{control.id}" do
          row 'Name' do
            control.name
          end
          row 'Type' do
            control.control_type
          end
          row 'Select Options' do
            control.select_options
          end
          row 'Action Verb' do
            control.action_verb
          end
          row 'Action URL' do
            control.action_url
          end
        end
      end
    end
  end
  
end
