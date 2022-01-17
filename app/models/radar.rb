class Radar < ApplicationRecord
  has_many :messages
  has_one :activity
  belongs_to :creator, class_name: 'User'
  has_many :radar_participants
  has_many :participants, through: :radar_participants, source: :user

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  scope :unrestricted, -> { active.where(private: false) }
  scope :restricted, -> { active.where(private: true) }
  scope :accessible_by_user, -> (user) {
    restricted.select do |radar|
      (radar.creator == user) || (radar.creator.follower_ids.include? user.id)
    end
  }
  scope :presentable, -> (user) { accessible_by_user(user) + unrestricted }

  def self.active
    first_date = DateTime.new(DateTime.now.year, DateTime.now.month, DateTime.now.day, 0, 0, 0, 0)
    second_date = DateTime.new(DateTime.now.year, DateTime.now.month, DateTime.now.day, 23, 59, 59, 0)
    where(time: first_date..second_date)
  end
end
