class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :item_id
      t.integer :kilos
      t.integer :price_per_kg
      t.integer :price_total
      t.string :selected_size
      t.string :selected_freeze
      t.string :selected_glaze
      t.string :catching_method

      t.timestamps
    end
  end
end
