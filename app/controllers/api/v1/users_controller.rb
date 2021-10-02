class Api::V1::UsersController < ApplicationController

    def index 
        users = User.all 
        render json: users 
      end
  
      def show
        user = User.find_by(id: params[:id])
        if user 
          render json: user
        else 
          render json: {message: 'User not found'}
        end
      end
  
      def create 
        if User.find_by(name: user_params[:name])
          user = User.find_by(name: user_params[:name])
          redirect_to "/api/v1/users/#{user.id}"
        else
          user = User.create(user_params)
          render json: user
        end
      end

      def update 
        user = User.find_by(name: user_params[:name])
        product = Product.find(user_params[:product_id])
        quantity = user_params[:quantity]
  
        cart_product = CartProduct.create!(cart_id: user.cart.id, product_id: user_params[:product_id], quantity: user_params[:quantity])
        user.cart << cart_product 
        user.save
        render json: user
      end
  
      private 
  
      def user_params
          permit(:name, :email, :image, :google_token)
      end

end
