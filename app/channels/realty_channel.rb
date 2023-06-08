class RealtyChannel < ApplicationCable::Channel

  def subscribed
    realty = Realty.find(params[:id])
    stream_for realty
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
