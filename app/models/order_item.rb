class OrderItem < ApplicationRecord
    has_many :orders
    has_one :item
end
