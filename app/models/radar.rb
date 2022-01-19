class Radar < ApplicationRecord
  has_many :messages
  has_one :activity
  belongs_to :creator, class_name: 'User'
  has_many :radar_participants, dependent: :destroy
  has_many :participants, through: :radar_participants, source: :user, dependent: :destroy
  validates :time, presence: true
  validates :activity_id, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  
  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode, if: :will_save_change_to_address?
  after_validation :reverse_geocode, :if => :latitude_changed?, :if => :longitude_changed?

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
