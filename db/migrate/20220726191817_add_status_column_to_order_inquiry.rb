class AddStatusColumnToOrderInquiry < ActiveRecord::Migration[7.0]
  def change
    add_column :order_inquiries, :status, :string
  end
end
