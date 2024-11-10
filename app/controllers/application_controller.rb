class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :authenticate_user_from_token!

  private

  def authenticate_user_from_token!
    token = request.headers['Authorization']
    user = User.find_by(authentication_token: token)

    if user
      @current_user = user
    else
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end

  def current_user
    @current_user
  end
end
