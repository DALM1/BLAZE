class AddDiscussionIdToMessages < ActiveRecord::Migration[7.1]
  def change
    add_column :messages, :discussion_id, :integer
  end
end
