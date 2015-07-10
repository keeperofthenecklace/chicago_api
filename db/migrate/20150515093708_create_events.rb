class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :event_begins_at
      t.datetime :event_ends_at
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
