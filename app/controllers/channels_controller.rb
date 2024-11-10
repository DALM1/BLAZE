class ChannelsController < ApplicationController
  before_action :authenticate_user_from_token!

  def index
    channels = Channel.all
    render json: channels, status: :ok
  end

  def create
    channel = Channel.new(channel_params)
    channel.user = current_user

    if channel.save
      render json: channel, status: :created
    else
      render json: { errors: channel.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def channel_params
    params.require(:channel).permit(:name)
  end
end
