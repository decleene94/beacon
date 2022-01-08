class Participant < ApplicationRecord
  # enum status:  [ :joined, :unjoined]
  belongs_to :radar
  belongs_to :user
end
