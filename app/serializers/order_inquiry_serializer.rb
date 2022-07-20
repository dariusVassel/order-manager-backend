class OrderInquirySerializer < ActiveModel::Serializer
  attributes :id, :item_id, :product_name, :quantity, :packing, :glaze, :shipment_date, :contact_name, :user_id, :contact_id, :order_item_id

  belongs_to :contact
end

