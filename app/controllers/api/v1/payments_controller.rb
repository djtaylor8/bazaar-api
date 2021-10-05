require 'stripe'
Stripe.api_key = ENV['stripe_secret']

class Api::V1::PaymentsController < ApplicationController

    def create_payment
        total_price = params[:amount].to_i
        currency = params[:currency]
        payment_intent = Stripe::PaymentIntent.create(
            amount: total_price,
            currency: currency
        )
        render json: { clientSecret: payment_intent.client_secret }
    end

    private 

    def payment_params
        params.permit(:amount, :currency, :paymentMethodType)
    end
end
