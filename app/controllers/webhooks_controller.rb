class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def stripe
    puts 'webhook received'
    payload = request.body.read
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    event = nil

    # testing secret
    endpoint_secret = ENV.fetch('STRIPE_WEBHOOK_TESTING_ENDPOINT_SECRET')

    begin
      event = Stripe::Webhook.construct_event(
        payload, sig_header, endpoint_secret
      )
    rescue JSON::ParserError => e
      # invalid payload
      status 400
      return
    rescue Stripe::SignatureVerificationError => e
      # invalid signature
      status 400
      return
    end

    create_order(event) if event['type'] == 'checkout.session.completed'

    render json: { message: 'success' }
  end

  private

  def create_order(event)
    session = event['data']['object']
    # user = User.find(session['client_reference_id'])
    if session['client_reference_id'] == session['metadata']['cartID']
      user = nil
    else
      user = User.find(session['client_reference_id'])
    end
    cart = Cart.find(session['metadata']['cartID'])

    order = Order.new(
      user: user,
      total_price: (session['amount_total'] / 100),
      shipping_name: session['shipping_details']['name'],
      address: session['shipping_details']['address'],
      billing_name: session['customer_details']['name'],
      billing_address: session['customer_details']['address']
    )

    cart.cart_items.each do |item|
      order.order_items.build(product: item.product, contents: item.contents)
    end

    order.save
  end
end
