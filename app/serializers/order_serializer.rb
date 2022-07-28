class OrderSerializer < ActiveModel::Serializer
  attributes :id, :po_number, :po_date, :internal_ref_number, :size, :glaze, :price_kg, :cartons, :packing, :kgs_carton, :packing_specs, :shipment_date, :payment_terms, :port_to, :port_from, :order_total,  :total_kilos, :order_status,  :buyer_id, :seller_id, :order_item_id, :selected_freeze

    belongs_to :buyer, class_name: 'User', foreign_key: :buyer_id
    belongs_to :seller, class_name: 'User', foreign_key: :seller_id
    belongs_to :order_item

end

