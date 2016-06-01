class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.text :address
      t.float :lat
      t.float :lng
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :places, :user_id
  end
end
