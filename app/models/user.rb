class User < ApplicationRecord
    has_secure_password

    belongs_to :organization

    has_one :user_info


    has_many :buyer_orders, class_name: "Order", foreign_key: "buyer_id"
    has_many :seller_orders, class_name: "Order", foreign_key: "seller_id"
    has_many :agent_orders, class_name: "Order", foreign_key: "agent_id"

    def orders
        Order.where("buyer_id = ? OR seller_id = ?", id, id)
    end
end

