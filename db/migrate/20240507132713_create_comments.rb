class CreateComments < ActiveRecord::Migration[6.1]

  def change

    create_table :comments do |t|

      t.string :title
      t.text :body
      t.integer :event_id, null: false, foreign_key: true
      t.integer :member_id, null: false, foreign_key: true

      t.timestamps

    end
  end
end
