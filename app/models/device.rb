class Device < ActiveRecord::Base
  belongs_to :device_type

  validates :name, presence: true
  validates :device_type, presence: true
  validates :ip_address, presence: true
end
