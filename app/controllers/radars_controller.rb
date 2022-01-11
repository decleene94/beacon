class RadarsController < ApplicationController
  before_action :authenticate_user!
  def index
    @radars = Radar.all
    @markers = @radars.map do |radar|
      {
        lat: radar.creator.latitude,
        lng: radar.creator.longitude,
        infoWindow: { content: render_to_string(partial: "/radars/map_info_window", locals: { radar: radar }) },
        # image_url: helpers.asset_url('icons8-cocktail-64.png')
      }
    end
  end

  def show
    @radar = Radar.find(params[:id])
    @message = Message.new
  end

  def create
    @radar = Radar.new(radar_params)
    # @radar.user = current_user
    @radar.creator = current_user
    # @radar.user_id = current_user
    # @radar.latitude = current_user.latitude
    @radar.save
    redirect_to radars_path
  end

  def new
    @radar = Radar.new
  end

  def delete
    @radar = Radar.find(params[:id])
    @user = current_user
    @radar.destroy
    redirect_to radars_path
  end

  def edit
  end

  def update
  end

  private
  def radar_params
    params.require(:radar).permit(:time, :radius, :description, :user_id, :activity_id)
  end
end
