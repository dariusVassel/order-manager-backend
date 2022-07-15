class Order < ApplicationRecord
    belongs_to :buyer, class_name: 'User', foreign_key: :buyer_id , dependent: :destroy
    belongs_to :seller, class_name: 'User', foreign_key: :seller_id, dependent: :destroy
    belongs_to :order_item
end
