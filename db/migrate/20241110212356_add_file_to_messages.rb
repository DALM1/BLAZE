class AddFileToMessages < ActiveRecord::Migration[7.1]
  def change
    add_column :messages, :file, :string
  end
end
