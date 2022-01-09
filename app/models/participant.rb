class Participant < ApplicationRecord
  # belongs_to :user
  # belongs_to :radar
  belongs_to :radar_participant, class_name: 'User'
  belongs_to :joined_radar, class_name: 'Radar'
end
