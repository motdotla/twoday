class DeviceType < ActiveRecord::Base
  has_many :controls

  validates :name, presence: true
end
