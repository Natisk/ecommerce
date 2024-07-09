# frozen_string_literal: true

module Stripe
  # A service to make api call to stripe
  class CheckoutService
    def initialize(cart)
      @cart = cart
    end

    def call
      Stripe.api_key = Rails.application.credentials.stripe.secret_key

      session = Stripe::Checkout::Session.create(
        mode: 'payment',
        line_items:,
        success_url: 'http://localhost:3000/stripe_payment_success',
        cancel_url: 'http://localhost:3000/stripe_payment_cancel',
        shipping_address_collection: {
          allowed_countries: %w[US CA]
        }
      )

      { result: session.url }
    end

    private

    attr_reader :cart

    def line_items
      cart.map do |item|
        product = ::Product.find_by(id: item['id'])
        stock = product.stocks.where('size = ?', item['size']).take

        # TODO: handle errors
        # if stock.count < item['quantity'].to_i
        #   return "error: Not enough stock for #{item.name} in size #{item.size}. Only #{stock.count}."
        # end

        {
          quantity: item['quantity'].to_i,
          price_data: {
            product_data: {
              name: item['name'],
              metadata: { product_id: product.id, size: item['size'], product_stock_id: stock.id }
            },
            currency: 'usd',
            unit_amount: item['price'].to_i
          }
        }
      end
    end
  end
end
