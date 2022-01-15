class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :messages
  has_one_attached :photo
  has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
  has_many :followees, through: :followed_users
  has_many :following_users, foreign_key: :followee_id, class_name: 'Follow'
  has_many :followers, through: :following_users

  has_many :radars, foreign_key: 'creator_id', class_name: 'Radar'
  has_many :radar_participants
  has_many :attending_radars, through: :radar_participants, source: :radar

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
