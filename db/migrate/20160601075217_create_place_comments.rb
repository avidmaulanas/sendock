class CreatePlaceComments < ActiveRecord::Migration
  def change
    create_table :place_comments do |t|
      t.integer :place_id
      t.integer :user_id
      t.text :content

      t.timestamps null: false
    end
    add_index :place_comments, :place_id
    add_index :place_comments, :user_id
  end
end
