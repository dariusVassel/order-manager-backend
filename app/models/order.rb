class Order < ApplicationRecord
    belongs_to :buyer, class_name: 'User', foreign_key: :buyer_id
    belongs_to :seller, class_name: 'User', foreign_key: :seller_id
    belongs_to :agent, class_name: 'User', foreign_key: :agent_id
    belongs_to :order_item
end
