class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :messages, dependent: :destroy
  has_one_attached :photo, dependent: :destroy
  has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
  has_many :followees, through: :followed_users
  has_many :following_users, foreign_key: :followee_id, class_name: 'Follow'
  has_many :followers, through: :following_users
  validates :phone, format: { with: /\+[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]/, message: "Do not include hyphens" }

  has_many :radars, foreign_key: 'creator_id', class_name: 'Radar', dependent: :destroy
  has_many :radar_participants, dependent: :destroy
  has_many :attending_radars, through: :radar_participants, source: :radar

  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode, :reverse_geocode, if: :will_save_change_to_address?
  after_validation :reverse_geocode, :if => :latitude_changed?, :if => :longitude_changed?
end
