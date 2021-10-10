class Category < ApplicationRecord
    has_many :cart_products, through: :products, :dependent => :destroy 
end
