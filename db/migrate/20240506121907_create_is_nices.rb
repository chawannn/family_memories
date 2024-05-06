class CreateIsNices < ActiveRecord::Migration[6.1]
  def change
    create_table :is_nices do |t|
      
      t.integer :member_id, null: false, foreign_key: true
      t.integer :event_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
