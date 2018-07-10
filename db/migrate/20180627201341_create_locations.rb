class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.integer :user_id
      t.string :name
      t.float :latitude
      t.float :longitude 

      t.timestamps
    end
  end
end
