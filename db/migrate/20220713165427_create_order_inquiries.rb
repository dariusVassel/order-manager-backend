class CreateOrderInquiries < ActiveRecord::Migration[7.0]
  def change
    create_table :order_inquiries do |t|
      t.integer :item_id
      t.string :product_name
      t.integer :quantity
      t.string :packing
      t.string :glaze
      t.date :shipment_date
      t.string :contact_name

      t.timestamps
    end
  end
end
