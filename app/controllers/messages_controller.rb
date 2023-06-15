class MessagesController < ApplicationController
  def index
    @realty = Realty.find(params[:realty_id])
    @messages = @realty.messages
    @message = Message.new
  end

  def create
    @realty = Realty.find(params[:realty_id])
    @message = Message.new(message_params)
    @message.realty = @realty
    @message.user = current_user
    if @message.save
      RealtyChannel.broadcast_to(
        @realty,
        { message: @message, sender_id: current_user.id }
      )
      head :ok
    else
      render :index, status: :unprocessable_entity
    end
  end

 private

  def message_params
    params.require(:message).permit(:content)
  end

end
