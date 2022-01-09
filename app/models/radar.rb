class Radar < ApplicationRecord
  has_many :participants, foreign_key: :joined_radar_id
  has_many :radar_participants, through: :participant, source: :radar_participant

  belongs_to :creator, class_name: 'User'
  has_many :messages
  has_one :activity
end
