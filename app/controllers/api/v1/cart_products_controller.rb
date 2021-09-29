class Api::V1::CartProductsController < ApplicationController
    before_action :set_cart_product, only: [:show, :destroy, :update]

    def index
      cart_products = CartProduct.all 
      render json: cart_products 
    end

    def show 
      render json: @cart_product
    end

    def create 
     cart_product = CartProduct.create(cart_product_params)
     render json: cart_product 
    end

    def update 
      if @cart_product.update(cart_product_params)
        render json: @cart_product
      else
        render json: { status: 'error', message: 'Sorry, there was an error!'}
    end

    def destroy 
      cart_product = CartProduct.find(params[:id])
      if cart_product.destroy 
        render json: { status: 'success', message: 'Product deleted' }
      else  
        render json: { status: 'error', message: 'Sorry, there was an error!' }
    end

    private

    def cart_product_params 
      params.require(:cart_products).permit(:cart_id, :product_id, :quantity)
    end
    
    def set_cart_product
      @cart_product = CartProduct.find(params[:id])
    end
end
