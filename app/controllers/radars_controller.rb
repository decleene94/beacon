class RadarsController < ApplicationController
  before_action :authenticate_user!
  def index
    if params[:order] == 'time'
      first_date = DateTime.new(DateTime.now.year, DateTime.now.month, DateTime.now.day, 0, 0, 0, 0)
      second_date = DateTime.new(DateTime.now.year, DateTime.now.month, DateTime.now.day, 23, 59, 59, 0)
      @radars = Radar.where(time: first_date..second_date )
    elsif params[:order] == 'distance'
      @radars = Radar.order('radius')
    else
      @radars = Radar.all
    end

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
    @radar.time = radar_params[:time].to_datetime
    # @radar.user = current_user
    @radar.creator = current_user
    # @radar.user_id = current_user
    # @radar.latitude = current_user.latitude
    @radar.save
    respond_to do |format|
      if @radar.save
        current_user.follower_ids.each do |follower|
          phone = User.find(follower).phone
          message = "#{@radar.creator.first_name} has created a new Beacon and is saying the following: '#{@radar.description}'! Care to join? Click here: http://beacon-692.herokuapp.com/radars/#{@radar.id}"
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
    params.require(:radar).permit(:time, :radius, :description, :user_id, :activity_id)
  end
end
