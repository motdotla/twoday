ActiveAdmin.register Device do
  permit_params do
    Device.column_names
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :ip_address
      f.input :control_values, as: :text
    end

    f.actions
  end
end
