class MessagesController < ApplicationController

  def create
    @radar = Radar.find(params[:radar_id])
    @message = Message.new(message_params)
    @message.radar = @radar
    @message.user = current_user

    if @message.save
      redirect_to radar_path(@radar, anchor: "message-#{@message.id}")
    else
      render "radars/show"
    end
  end

  def message_params
    params.required(:message).permit(:content)
  end

end
