class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :body
      t.datetime :start_time
      t.datetime :end_time
      t.references :member, null: false, foreign_key: true

      t.timestamps
    end
  end
end
