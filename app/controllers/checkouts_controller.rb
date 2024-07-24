class CheckoutsController < ApplicationController
  before_action :set_cart, only: %i[create success]

  def create
    resp = StripeService.create_checkout_session(
      current_user,
      @cart,
      success_url: success_checkouts_url,
      cancel_url: cart_url
    )

    if resp.success?
      redirect_to resp.url, allow_other_host: true
    else
      flash[:notice] = resp.error
      redirect_to new_checkout_path
    end
  end

  def success
    @cart.destroy
    flash[:notice] = 'Thank you for your purchase!'
    redirect_to root_path
  end

  private

  def set_cart
    @cart = Cart.find_by(user_id: current_user.id)
  end
end
