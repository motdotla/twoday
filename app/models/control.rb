class Control < ActiveRecord::Base
  AVAILABLE_CONTROL_TYPES = %w(slider select button).freeze
  AVAILABLE_ACTION_VERBS = %w(POST PUT PATCH).freeze

  belongs_to :device_type

  validates :name, presence: true
  validates :control_type, presence: true, inclusion: { in: AVAILABLE_CONTROL_TYPES }
  validates :select_options, presence: true, if: Proc.new { |c| c.control_type == 'select' }
  validates :action_verb, presence: true, inclusion: { in: AVAILABLE_ACTION_VERBS }, allow_blank: true
  validates :action_url, format: { with: URI.regexp }, allow_blank: true

  def options
    # simple comma separated list for this prototype. select_options would be one of the first places to get beefed up. it needs to fetch from a large and dynamic list of playlists.
    select_options.split(',').map(&:strip)
  end
end
