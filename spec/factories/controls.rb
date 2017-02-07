FactoryGirl.define do
  factory :control do
    device_type

    name 'Volume'
    control_type 'slider'
    select_options 'Britney Spears, G-Eazy'
  end
end
