class RadarsController < ApplicationController
  before_action :authenticate_user!
  def index
    @radars = Radar.all
    @markers = @radars.map do |radar|
      {
        lat: radar.user.latitude,
        lng: radar.user.longitude,
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
    @radar.user = current_user
    # @radar.latitude = current_user.latitude
    @radar.save
    respond_to do |format|
      if @radar.save
        current_user.follower_ids.each do |follower|
          phone = User.find(follower).phone
          message = "#{@radar.user.first_name} has created a new Beacon and are saying the following: '#{@radar.description}'!"
          TwilioClient.new(message, phone).sms
          format.html { redirect_to radars_path, notice: 'Your Beacon was successfully created.' }
        end
      else
        format.html { render :new }
      end
    end
    # redirect_to radars_path
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
