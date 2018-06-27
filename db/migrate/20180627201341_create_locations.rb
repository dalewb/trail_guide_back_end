class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.integer :user_id
      t.string :name
      t.integer :latitude
      t.integer :longitude 

      t.timestamps
    end
  end
end
