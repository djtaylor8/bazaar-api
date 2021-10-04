class Api::V1::CartsController < ApplicationController
    def show
      cart = Cart.find(params[:id])
      render json: cart 
    end

    def create 
      cart = Cart.create(cart_params)
      render json: cart 
    end

    def update 
      user = User.find(cart_params[:user_id])
      product = Product.find(cart_params[:product_id])
      quantity = cart_params[:quantity]

      cart_product = CartProduct.create!(cart_id: user.cart.id, product_id: cart_params[:product_id], quantity: cart_params[:quantity])
      user.cart.cart_products << cart_product 
      user.save!
      render json: product
    end

    def remove_product 
      user = User.find(cart_params[:user_id])
      product_to_remove = Product.find(cart_params[:product_id])

      user.cart.cart_products.select {|product| product.id != product_to_remove.id}
      user.save!
      render json: product_to_remove
    end

    private 

    def cart_params 
      params.permit(:user_id, :cart_id, :product_id, :quantity)
    end
end
