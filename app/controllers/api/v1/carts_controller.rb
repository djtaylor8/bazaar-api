class Api::V1::CartsController < ApplicationController
    def show
      cart = Cart.find(params[:id])
      render json: cart 
    end

    def create 
      cart = Cart.create(cart_params)
      render json: cart 
    end

    private 

    def cart_params 
      params.permit(:user_id)
    end
end
