class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name ,null: false
      t.text :description ,null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :shipping_cost_id, null: false
      t.integer :area_id, null: false
      t.integer :delivery_day_id, null: false
      t.integer :price, null: false
      t.timestamps
      t.references :user, null: false, foreign_key: true
    end
  end
end
