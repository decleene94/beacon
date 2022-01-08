class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :messages
  # has_many :radars, foreign_key: 'user_id', class_name: 'radar'
  has_many :radars
  # has_many :participants, foreign_key: 'attendee_id'
  has_many :participants
  # has_many :joined_beacons, through: :participants, source: :user
  has_one_attached :photo
end
