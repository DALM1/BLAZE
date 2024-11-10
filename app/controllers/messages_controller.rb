class MessagesController < ApplicationController
  before_action :authenticate_user_from_token!
  before_action :set_channel_and_discussion

  def create
    @message = @discussion.messages.new(message_params)
    @message.user = current_user
    @message.channel_id = @channel.id # Ajout explicite du channel_id

    if @message.save
      render json: @message, status: :created
    else
      render json: { errors: @message.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_channel_and_discussion
    @channel = Channel.find(params[:channel_id])
    @discussion = @channel.discussions.find(params[:discussion_id])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: ['Channel or Discussion not found'] }, status: :not_found
  end

  def message_params
    params.require(:message).permit(:content, :file_url)
  end
end
