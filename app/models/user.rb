class User < ApplicationRecord
    has_secure_password

    belongs_to :organization

    has_one :user_info, dependent: :destroy

    has_many :order_inquiries
    has_many :contacts, through: :order_inquiries


    has_many :buyer_orders, class_name: "Order", foreign_key: "buyer_id", dependent: :nullify
    has_many :seller_orders, class_name: "Order", foreign_key: "seller_id", dependent: :nullify

    validates :username, presence: true, length: {minimum: 2}, uniqueness: true
    validates :password, presence: true

   
    # def orders
    #     Order.where("buyer_id = ? OR seller_id = ?", id, id)
    # end
end

