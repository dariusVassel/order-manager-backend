class AddColumnToOrderInquiry < ActiveRecord::Migration[7.0]
  def change
    add_column :order_inquiries, :contact_id, :integer
    add_column :order_inquiries, :user_id, :integer
    add_column :order_inquiries, :order_item_id, :integer
  end
end
