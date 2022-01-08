class ParticipantsController < ApplicationController
  before_action :authenticate_user!

  def join
    @radar = Radar.find(params[:id])
    @participant = current_user
    # @participant.status = "joined"
    @radar.participants << @participant
    @radar.save
    redirect_to radars_path
  end


private
  def participants_params
    params.require(:participants).permit(:time, :radius, :description, :user_id, :radar_id, :enum)
  end
end
