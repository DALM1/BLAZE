class DiscussionsController < ApplicationController
  before_action :authenticate_user_from_token!

  def index
    channel = Channel.find(params[:channel_id])
    discussions = channel.discussions
    render json: discussions
  end

  def create
    channel = Channel.find(params[:channel_id])
    discussion = channel.discussions.new(discussion_params.merge(user: current_user))

    if discussion.save
      render json: discussion, status: :created
    else
      render json: { errors: discussion.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def discussion_params
    params.require(:discussion).permit(:title)
  end
end
