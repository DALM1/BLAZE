class AddMissingIndexToAuthenticationToken < ActiveRecord::Migration[7.1]
  def change
    unless index_exists?(:users, :authentication_token)
      add_index :users, :authentication_token, unique: true
    end
  end
end
