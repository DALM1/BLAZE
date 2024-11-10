class ChannelsController < ApplicationController
  before_action :authenticate_user!

  def index
    @channels = Channel.all
    render json: @channels
  end

  def create
    @channel = current_user.channels.build(channel_params)
    if @channel.save
      render json: @channel, status: :created
    else
      render json: { errors: @channel.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def channel_params
    params.require(:channel).permit(:name, :description, :is_private)
  end
end
