class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
         # :confirmable à ajouter pour gérer la confirmation de compte par mail
         # voir lorsqu'on implémentera le mailer
  has_many :items, :class_name => 'Item', :foreign_key => 'seller_id'
  has_many :orders, :class_name => 'Order', :foreign_key => 'buyer_id'
  has_one :cart, :class_name => 'Cart', :foreign_key => 'buyer_id'
end
