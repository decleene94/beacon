class Radar < ApplicationRecord
  belongs_to :user
  has_many :messages
  has_one :activity
  has_many :participants
end
