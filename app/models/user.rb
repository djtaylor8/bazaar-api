class User < ApplicationRecord
    has_many :comments, :dependent => :destroy 
    has_one :cart 
    has_many :products, :dependent => :destroy
    has_many :cart_products, through: :cart, :dependent => :destroy 
end
