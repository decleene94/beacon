class Radar < ApplicationRecord
  has_many :messages
  has_one :activity
  belongs_to :creator, class_name: 'User'
  has_many :participants, through: :radar_participants


end


#Radar.creator
#Radar.
#Radar.guests
