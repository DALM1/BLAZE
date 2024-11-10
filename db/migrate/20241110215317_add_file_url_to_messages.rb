class AddFileUrlToMessages < ActiveRecord::Migration[7.1]
  def change
    add_column :messages, :file_url, :string
  end
end
