class Radar < ApplicationRecord
  belongs_to :user
  has_many :participants
  has_many :messages
  has_one :activity
end
