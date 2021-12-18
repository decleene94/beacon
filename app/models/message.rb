class Message < ApplicationRecord
  belongs_to :radar
  has_one :user
end
