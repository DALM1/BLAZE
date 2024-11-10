class CreateCalls < ActiveRecord::Migration[7.1]
  def change
    create_table :calls do |t|
      t.string :status
      t.text :participants
      t.datetime :started_at
      t.datetime :ended_at

      t.timestamps
    end
  end
end
