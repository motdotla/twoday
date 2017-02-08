desc 'Load dev data for development'
task load_dev_data: :environment do

  def create_admin_user
    au = AdminUser.create!(email: 'mot@mot.la', password: 'Password123')
    puts "AdminUser: #{au.email} | Password123"
  end

  def create_samsung
    DeviceType.create!(
      name: 'Samsung Audio',
      controls_attributes: [
        {
          name: 'Power',
          control_type: 'button'
        },
        {
          name: 'Volume',
          control_type: 'slider'
        },
        {
          name: 'Playlist',
          control_type: 'select',
          select_options: 'Britney Spears, G-Eazy, Bob Dylan, John Elton'
        }
      ]
    )
    puts "Created Samsung DeviceType"
  end

  def create_sony
    DeviceType.create!(
      name: 'Sony Audio',
      controls_attributes: [
        {
          name: 'Power',
          control_type: 'button'
        },
        {
          name: 'Volume',
          control_type: 'slider'
        },
        {
          name: 'Playlist',
          control_type: 'select',
          select_options: 'Britney Spears, G-Eazy, Bob Dylan, John Elton'
        }
      ]
    )

    puts "Created Sony DeviceType"
  end

  def create_apple_tv
    DeviceType.create!(
      name: 'Apple TV',
      controls_attributes: [
        {
          name: 'Power',
          control_type: 'button'
        },
        {
          name: 'Brightness',
          control_type: 'slider'
        },
        {
          name: 'Volume',
          control_type: 'slider'
        }
      ]
    )

    puts "Created Apple TV"
  end

  def create_citrus_lights
    DeviceType.create!(
      name: 'Citrus Lights',
      controls_attributes: [
        {
          name: 'On/Off',
          control_type: 'button'
        }
      ]
    )

    puts "Created Citrus Lights"
  end

  # reset/clean db
  AdminUser.destroy_all
  Device.destroy_all
  Control.destroy_all
  DeviceType.destroy_all

  create_admin_user
  create_samsung
  create_sony
  create_apple_tv
  create_citrus_lights

  puts "done"

end
