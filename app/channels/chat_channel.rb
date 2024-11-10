class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "channel_#{params[:channel_id]}"
  end

  def unsubscribed
    # Cleanup
  end

  def speak(data)
    Message.create!(
      user: current_user,
      channel_id: data['channel_id'],
      content: data['content']
    )
  end
end
