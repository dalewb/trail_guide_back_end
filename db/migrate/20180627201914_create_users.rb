class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :type
      t.string :username
      t.string :gender
      t.string :start_date

      t.timestamps
    end
  end
end
