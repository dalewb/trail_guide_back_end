class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :bookings, :dote, :date
  end
end
