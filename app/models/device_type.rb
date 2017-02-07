class DeviceType < ActiveRecord::Base
  has_many :controls

  accepts_nested_attributes_for :controls

  validates :name, presence: true

end
