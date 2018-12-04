class Order < ApplicationRecord
    has_one :item
    belongs_to :buyer, class_name: "User"
    # has_one :seller, through: :item, source: :user
end
