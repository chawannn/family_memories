class CreateEventMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :event_members do |t|
      
      t.references :event, null: false, foreign_key: true
      t.references :member, null: false, foreign_key: true
      t.boolean :is_done, default: false, null: false
      t.boolean :is_nice, default: false, null: false
      t.timestamps
    end
  end
end
