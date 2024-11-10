class AddNotNullToAuthenticationToken < ActiveRecord::Migration[7.1]
  def change
    change_column_null :users, :authentication_token, false
  end
end
