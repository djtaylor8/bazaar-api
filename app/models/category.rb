class Category < ApplicationRecord
    has_many :products, :dependent => :destroy 
    has_many :cart_products, through: :products, :dependent => :destroy 
end
