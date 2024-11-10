class CreateChannels < ActiveRecord::Migration[7.1]
  def change
    create_table :channels do |t|
      t.string :name, null: false
      t.text :description
      t.boolean :is_private, default: false
      t.references :owner, foreign_key: { to_table: :users }, null: false

      t.timestamps
    end
  end
end
