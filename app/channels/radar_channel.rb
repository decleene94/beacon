class RadarChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    radar = Radar.find(params[:id])
    stream_for radar
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
