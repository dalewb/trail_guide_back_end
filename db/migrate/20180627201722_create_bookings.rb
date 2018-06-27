class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :location_id
      t.string :dote
      t.string :time

      t.timestamps
    end
  end
end
