class AddIpAddressToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :ip_address, :string
  end
end
