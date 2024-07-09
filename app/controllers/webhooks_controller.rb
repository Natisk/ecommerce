# frozen_string_literal: true

# controller to process all webhooks
class WebhooksController < ApplicationController
  skip_forgery_protection

  def stripe
    Stripe.api_key = Rails.application.credentials.stripe.secret_key
    payload = request.body.read
    sig_header = request.env['HTTP-STRIPE-SIGNATURE']
    endpoint_secret = Rails.application.credentials.stripe.webhook_secret

    begin
      event = Stripe::Webhook.construct_event(payload, sig_header, endpoint_secret)
    rescue JSON::ParserError => e
      # send to system monitor(rollbar, honeybadger etc.)
      status 400 and return
    rescue Stripe::SignatureVerificationError => e
      # send to system monitor(rollbar, honeybadger etc.)
      status 400 and return
    end

    case event.type
    when 'checkout.session.completed'
      session = event.data.object
      shipping_details = session['shipping_details']
      address = "#{shipping_details['address']['line1']} #{singleton_details['address']['city']},
                #{shipping_details['address']['state']} #{shipping_details['address']['postal_code']}"
      # TODO: create order serivce to create orders
      order = Order.create!(customer_email: session['customer_details']['email'],
                            total: session['amount_total'],
                            address:,
                            fulfilled: false)
      full_session = Stripe::Checkout::Session.retrieve({
                                                          id: session.id,
                                                          expand: ['line_items']
                                                        })
      line_items = full_session.line_items
      line_items['data'].each do |item|
        product = Stripe::Product.retrieve(item['price']['product'])
        product_id = product['metadata']['product_id'].to_i
        OrderProduct.create!(order:,
                             product_id:,
                             quantity: item['quantity'],
                             size: product['metadata']['size'])
        Stock.find(product['metadata']['product_stock_id'])
             .decrement!(amount: item['quantity'])
      end
    else
      # send to system monitor(rollbar, honeybadger etc.)
      p "Unhandled event type: #{event.type}"
    end

    render json: { message: 'success' }
  end
end
