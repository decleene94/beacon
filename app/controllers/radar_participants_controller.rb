class RadarParticipantsController < ApplicationController
  before_action :authenticate_user!

private
  def participants_params
    params.require(:participants).permit(:time, :radius, :description, :user_id, :radar_id)
  end
end
