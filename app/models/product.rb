class Product < ApplicationRecord
    # belongs_to :category
    belongs_to :user  
    has_many :comments, :dependent => :destroy 
    has_many :cart_products, :dependent => :destroy 
end
