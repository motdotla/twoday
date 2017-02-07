class Control < ActiveRecord::Base
  AVAILABLE_CONTROL_TYPES = %w(slider select button).freeze

  belongs_to :device_type

  validates :name, presence: true
  validates :device_type, presence: true
  validates :control_type, presence: true, inclusion: { in: AVAILABLE_CONTROL_TYPES }
end
