class Item < ApplicationRecord
  belongs_to :category
  belongs_to :seller, class_name: "User"
  belongs_to :cart
  belongs_to :order
end
