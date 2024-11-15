class CreateDiscussions < ActiveRecord::Migration[7.1]
  def change
    create_table :discussions do |t|
      t.string :title
      t.references :channel, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
