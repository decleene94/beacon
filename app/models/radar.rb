class Radar < ApplicationRecord
  has_many :messages
  has_one :activity
  belongs_to :creator, class_name: 'User'
  has_many :radar_participants
  has_many :participants, through: :radar_participants, source: :user


end


#Radar.creator
#Radar.
#Radar.guests
