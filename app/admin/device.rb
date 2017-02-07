ActiveAdmin.register Device do
  permit_params do
    Device.column_names
  end
end
