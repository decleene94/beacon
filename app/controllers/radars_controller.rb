class RadarsController < ApplicationController
  def index
    @radars = Radar.all
  end

  def show
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
