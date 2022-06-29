class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :order_status
      t.date :po_date
      t.integer :po_number
      t.integer :internal_ref_number
      t.integer :order_item_id
      t.string :sizd
      t.string :glaze
      t.integer :price_ks
      t.integer :cartons
      t.string :packing
      t.integer :kgs_carton
      t.string :packing_specs
      t.date :shipment_date
      t.string :payment_terms
      t.string :port_to
      t.string :port_from
      t.integer :order_total
      t.string :freeze
      t.integer :total_kilos
      
      t.references :buyer, references: :users, foreign_key: {
        to_table: :users}
      t.references :seller, references: :users, foreign_key: {
        to_table: :users}  
      t.references :agent, references: :users, foreign_key: {
        to_table: :users}

      t.timestamps
    end
  end
end
