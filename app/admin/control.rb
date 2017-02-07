ActiveAdmin.register Control do
  permit_params do
    Control.column_names
  end
end
