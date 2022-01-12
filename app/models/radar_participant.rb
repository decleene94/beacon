class RadarParticipant < ApplicationRecord
  # belongs_to :user
  # belongs_to :radar
  belongs_to :radar, class_name: "Radar"
  belongs_to :user, class_name: "User"
  validates :user, uniqueness: true

end
