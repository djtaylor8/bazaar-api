class User < ApplicationRecord
    has_one :cart 
    has_many :products, :dependent => :destroy
    has_many :cart_products, through: :cart, :dependent => :destroy 
    has_many :orders 

    def self.create_user_for_google(data)                  
        where(email: data["email"]).first_or_initialize.tap do |user|
          user.google_token=data["sub"].to_s
          user.name=data["name"]
          user.email=data["email"]
          user.image=data["picture"]
          user.cart=Cart.create!(user: user)
          user.save!
        end
      end 
end
