class Item < ApplicationRecord
  belongs_to :category
  belongs_to :seller, class_name: "User"
  belongs_to :cart, optional: true
  belongs_to :order, optional: true
end
