class Radar < ApplicationRecord
  # belongs_to :user
  # belongs_to :user, class_name: 'User'
  belongs_to :user
  # has_many :participants, foreign_key: 'radar_id'
  has_many :participants
  # has_many :attendees, through: :participants, source: :radar
  has_many :messages
  has_one :activity
end
