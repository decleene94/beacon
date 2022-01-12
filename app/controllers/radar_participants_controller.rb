class RadarParticipantsController < ApplicationController
  before_action :authenticate_user!

  # def join
  #   @radar = Radar.find(params[:id])
  #   @user = current_user
  #   @radar.participants << current_user
  #   redirect_to radars_path
  # end


private
  def participants_params
    params.require(:participants).permit(:time, :radius, :description, :user_id, :radar_id, :enum)
  end
end
