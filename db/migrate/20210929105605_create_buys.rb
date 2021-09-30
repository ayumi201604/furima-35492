class CreateBuys < ActiveRecord::Migration[6.0]
  def change
    create_table :buys do |t|
      t.string :postal_code, null: false
      t.integer :area_id, null: false
      t.string :municipalitie, null: false
      t.string :address, null: false
      t.string :building_name
      t.string :telephone_number, null: false
      t.references :item_user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
