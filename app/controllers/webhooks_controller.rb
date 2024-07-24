class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def stripe
    puts 'webhook received'
    payload = request.body.read
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    event = nil

    # testing secret
    endpoint_secret = 'whsec_3bceecef14ad5b48633286fffc906e1f877f60697c37832159fa7a05fab866a2'

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
    # create_order(event) if event['type'] == 'payment_intent.succeeded'

    render json: { message: 'success' }
  end

  private

  def create_order(event)
    session = event['data']['object']
    user = User.find(session['client_reference_id'])
    cart = Cart.find_by(user_id: user.id)

    order = Order.new(
      user: user,
      total_price: (session['amount_total'] / 100),
      shipping_name: session['shipping_details']['name'],
      address: session['shipping_details']['address'],
      billing_name: session['customer_details']['name'],
      billing_address: session['customer_details']['address']
    )

    cart.products.each do |product|
      order.products << product
    end

    order.save
  end
end
