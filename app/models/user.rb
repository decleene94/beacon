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
  # has_many :radars
  has_many :participants, foreign_key: :radar_participant_id
  has_many :joined_radars, through: :participant
  has_many :created_radars, foreign_key: :creator_id, class_name: "Radar"
end
