require 'stripe'
Stripe.api_key = ENV['stripe_secret']

class Api::V1::PaymentsController < ApplicationController

    def create_payment
        # byebug
        user = User.find(params[:user][:id])
        total_price = params[:amount].to_i
        currency = params[:currency]
        payment_intent = Stripe::PaymentIntent.create(
            amount: total_price,
            currency: currency
        )
        
        order = Order.create!(user: user, address: params[:address], city: params[:city], state: params[:state], total: params[:amount])
        render json: { clientSecret: payment_intent.client_secret, order: order }
    end

    private 

    def payment_params
        params.permit(:amount, :currency, :paymentMethodType, :address, :city, :state, :user)
    end
end
