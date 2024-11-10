class Users::SessionsController < Devise::SessionsController
  def create
    self.resource = warden.authenticate!(auth_options)
    if resource
      render json: {
        message: "Logged in successfully.",
        user: {
          id: resource.id,
          email: resource.email,
          authentication_token: resource.authentication_token
        }
      }, status: :ok
    else
      render json: { error: "Invalid login credentials" }, status: :unauthorized
    end
  end
end
