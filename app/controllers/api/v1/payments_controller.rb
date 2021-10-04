require 'stripe'
Stripe.api_key = ENV['stripe_secret']

class Api::V1::PaymentsController < ApplicationController

    def create_payment
        payment_intent = Stripe::PaymentIntent.create(
            amount: 1999,
            currency: 'usd'
        )
        render json: { clientSecret: payment_intent.client_secret }
    end
end
