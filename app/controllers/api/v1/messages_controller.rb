class Api::V1::MessagesController < ApplicationController
  before_action :set_channel

  def index
    messages = @channel.messages.order('created_at ASC')
    render json: messages
  end

  def create
    message = Message.new(message_params)
    message.channel = @channel
    message.user = current_user
    message.save!
    render json: message
  end

  private

  def set_channel
    @channel = Channel.find_by_name(params[:channel_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
