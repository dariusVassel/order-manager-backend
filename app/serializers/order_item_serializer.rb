class OrderItemSerializer < ActiveModel::Serializer
  attributes :id, :item_id, :kilos, :item_id
  belongs_to :item
end
