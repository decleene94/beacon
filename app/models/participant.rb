class Participant < ApplicationRecord
  belongs_to :radar
  belongs_to :user
end
