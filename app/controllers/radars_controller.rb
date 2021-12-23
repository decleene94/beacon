class RadarsController < ApplicationController
  def index
    @radars = Radar.all
    # @location = radar.user_id.latitude
  end

  def show
    @radar = Radar.find(params[:id])
    @message = Message.new
  end

  def edit
  end

  def update
  end

  def create
  end

  def new
  end

  private
  def companion_params
    params.require(:companion).permit(:description, :price, photos: [])
  end
end
