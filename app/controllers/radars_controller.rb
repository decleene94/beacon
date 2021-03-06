class RadarsController < ApplicationController
  before_action :authenticate_user!

  def index
    @sorted_radars = Radar.near((current_user)).presentable(current_user)
    presentable_radars = Radar.presentable(current_user)
    @user = current_user

    if params[:order] == 'time'
      # to do - test with more beacons that are scheduled for the current day
      @radars = presentable_radars.sort_by(&:time)
    elsif params[:order] == 'distance'
      @radars = @sorted_radars
      # @radars = current_user.nearbys(&:distance)
    else
      @radars = presentable_radars
    end


    @markers = presentable_radars.map do |radar|
      {
        lat: radar.latitude,
        lng: radar.longitude,
        infoWindow: { content: render_to_string(partial: "/radars/map_info_window", locals: { radar: radar }) },
        activity: radar.activity_id,
      }
    end
  end

  def show
    @radar = Radar.find(params[:id])
    @message = Message.new
  end

  def create
    @radar = Radar.new(radar_params)
    @radar.creator = current_user
    @radar.time = radar_params[:time].to_datetime
    @radar.save

    if @radar.save
      current_user.follower_ids.each do |follower|
        phone = User.find(follower).phone
        message = "#{@radar.creator.first_name} has created a new Beacon and is saying the following: '#{@radar.description}'! Care to join? http://www.beacon.place/radars/#{@radar.id}"
        TwilioClient.new(message, phone).sms
        #format.html { redirect_to radars_path, notice: 'Your Beacon was successfully created.' }
      end
      # else
      #  format.html { render :new }
    end
    redirect_to radars_path
  end

  def new
    @radar = Radar.new
  end

  def destroy
    @radar = Radar.find(params[:id])
    #@user = current_user
    @radar.destroy
    redirect_to radars_path
  end

  def join
    @radar = Radar.find(params[:id])
    if @radar.participants.include?(current_user)
      redirect_to radar_path(@radar)
    else
      @radar.participants << current_user
      @radar.save
      redirect_to radar_path(@radar)
    end
  end

  def leave
    @radar = Radar.find(params[:id])
    @user = current_user
    @radar.participants.delete(current_user)
    @radar.save
    redirect_to radars_path
  end

  def edit
  end

  def update
  end

  private
  def radar_params
    params.require(:radar).permit(:time, :radius, :description, :user_id, :activity_id, :latitude, :longitude, :private, :address)
  end
end
