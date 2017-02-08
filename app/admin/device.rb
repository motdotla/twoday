ActiveAdmin.register Device do
  permit_params do
    Device.column_names
  end

  form do |f|
    f.inputs do
      f.input :device_type
      f.input :name
      f.input :ip_address
    end

    f.actions
  end

  index do
    column :id
    column :name
    column :ip_address
    column :device_type
    column :created_at
    column :updated_at
    actions
  end

  show do |device|
    panel 'Basics' do
      attributes_table_for device do
        row :name
        row :ip_address
      end
    end

    panel 'Control Values' do
      attributes_table_for device do
        device.device_type.controls.each do |control|
          row control.name do
            device.send("control_#{control.id}")
          end
        end
      end
    end
  end
end
