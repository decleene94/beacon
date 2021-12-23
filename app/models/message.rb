class Message < ApplicationRecord
  belongs_to :radar
  belongs_to :user
  # has_many :participants, through: :radars
end
