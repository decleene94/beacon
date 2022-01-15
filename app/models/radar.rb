class Radar < ApplicationRecord
  has_many :messages
  has_one :activity
  belongs_to :creator, class_name: 'User'
  has_many :radar_participants
  has_many :participants, through: :radar_participants, source: :user

  def self.active
    first_date = DateTime.new(DateTime.now.year, DateTime.now.month, DateTime.now.day, 0, 0, 0, 0)
    second_date = DateTime.new(DateTime.now.year, DateTime.now.month, DateTime.now.day, 23, 59, 59, 0)
    where(time: first_date..second_date)
  end
end
