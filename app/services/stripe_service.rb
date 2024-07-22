module StripeService
  module_function

  def create_checkout_session(user, cart, success_url:, cancel_url:)
    session = Stripe::Checkout::Session.create({
      success_url: success_url,
      cancel_url: cancel_url,
      payment_method_types: ['card'],
      client_reference_id: user.id,
      allow_promotion_codes: false,
      mode: 'payment',
      line_items: cart.products.uniq.map do |product|
        {
          price_data: {
            currency: 'cad',
            unit_amount: product.price.to_i * 100,
            product_data: {
              name: product.name,
              description: product.description,
              metadata: {
                productID: product.id,
                userId: user.id
              }
            }
          },
          quantity: cart.products.where(id: product.id).count
        }
      end
    })

    StripeServiceResponse.new(
      status: "ok",
      error: nil,
      url: session.url
    )
  rescue  => e
    StripeServiceResponse.new(
      status: "error",
      error: e.message,
    )
  end

  class StripeServiceResponse < Struct.new(:status, :error, :url, keyword_init: true)
    def success?
      status == "ok"
    end
  end
end
