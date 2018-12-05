class Item < ApplicationRecord
  belongs_to :category
  belongs_to :seller, class_name: "User"
  belongs_to :cart, optional: true
  belongs_to :order, optional: true

    # tells the model to use active storage for :images 
  has_many_attached :item_images

    # Scope permitting access only to items which are published
    # Usefull for page index products
  scope :published, -> {where(status: "published")}

end
