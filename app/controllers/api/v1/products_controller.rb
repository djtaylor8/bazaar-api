class Api::V1::ProductsController < ApplicationController
    before_action :set_product, only: [:update, :destroy]

    def index
        products = Product.all 
        render json: products 
      end
  
      def create
        product = Product.new(product_params)
        if product.save
          render json: product 
        else
          render json: { status: 'error', message: "Sorry, the product did not save!"}
        end
      end
  
      def update
        if @product.update(product_params)
          render json: @product
        else 
          render json:  { status: 'error', message: 'Sorry, the product was not updated!'}
        end
      end
  
      def destroy
        if @product.destroy
          render json: { status: 'success', message: 'Product deleted'}
        else
          render json: { status: 'error', message: 'Sorry, the product was not deleted!'}
        end
      end

      private 

      def product_params
        params.require(:product).permit(:name, :description, :type, :price, :total_availablem :image, :user_id)
      end

      def set_product
        @product = Product.find(params[:id])
      end

end
