class MessagesController < ApplicationController
  before_action :authenticate_user_from_token!
  before_action :set_channel_and_discussion

  def index
    @messages = @discussion.messages.order(created_at: :asc)
    render json: @messages, status: :ok
  end

  def create
    @message = @discussion.messages.new(message_params)
    @message.user = current_user
    @message.channel_id = @channel.id

    if @message.save
      render json: @message, status: :created
    else
      render json: { errors: @message.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @message = @discussion.messages.find_by(id: params[:id])
    if @message
      if @message.destroy
        render json: { message: 'Message deleted successfully' }, status: :ok
      else
        render json: { errors: @message.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { errors: ['Message not found'] }, status: :not_found
    end
  end

  private

  def set_channel_and_discussion
    @channel = Channel.find_by(id: params[:channel_id])
    @discussion = @channel&.discussions.find_by(id: params[:discussion_id])
    unless @channel && @discussion
      render json: { errors: ['Channel or Discussion not found'] }, status: :not_found
    end
  end

  def message_params
    params.require(:message).permit(:content, :file_url, :file)
  end
end
