class CreateCommodities < ActiveRecord::Migration[5.2]
  def change
    create_table :commodities do |t|
      t.string :commodity_type
      t.string :name
      t.integer :price
      t.string :img_url

      t.timestamps
    end
  end
end
