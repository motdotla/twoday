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
end
