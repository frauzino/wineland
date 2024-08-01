class CartsController < ApplicationController
  before_action :set_cart, only: %i[ show edit update destroy add_to_cart remove_from_cart update_cart ]
  before_action :set_quantities, only: %i[ show add_to_cart remove_from_cart ]

  # GET /carts or /carts.json
  def index
    @carts = Cart.all
  end

  # GET /carts/1 or /carts/1.json
  def show
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts or /carts.json
  def create
    @cart = Cart.new(cart_params)
  end

  def add_to_cart
    product_contents = params[:contents].to_unsafe_h if params[:contents].present?
    product = Product.find(params[:product_id])
    quantity = params[:quantities][params[:product_id]].to_i

    quantity.times do
      CartItem.create(cart: @cart, product: product, contents: (product_contents if product_contents.present?))
      @cart.total_price += product.price
    end

    return redirect_to products_path, notice: 'Product was not added to cart.' unless @cart.save

    render turbo_stream: turbo_stream.prepend('flashes',
                                              partial: 'shared/flash',
                                              locals: { notice: "#{product.name} added to cart" })
  end

  def remove_from_cart
    product = Product.find(params[:product_id])
    cart_items_to_delete = @cart.cart_items.where(product: product, contents: params[:contents])
    cart_items_to_delete_count = cart_items_to_delete.count
    @cart.cart_items.delete(cart_items_to_delete)
    cart_items_to_delete_count.times do
      @cart.total_price -= product.price
    end

    return redirect_to cart_path(@cart), notice: "#{product.name} was not removed from cart." unless @cart.save

    render turbo_stream: [
      turbo_stream.replace("cart_#{@cart.id}", partial: 'carts/cart', locals: { cart: @cart }),
      turbo_stream.prepend('flashes', partial: 'shared/flash', locals: { notice: "#{product.name} removed from cart" })
    ]
  end

  def update_cart
    params[:quantities].each do |cart_item_id, new_quantity|
      cart_item = CartItem.find(cart_item_id)
      current_quantity = @cart.cart_items.where(product: cart_item.product, contents: cart_item.contents).count
      difference = new_quantity.to_i - current_quantity

      if difference.positive?
        difference.times do
          CartItem.create(cart: @cart, product: cart_item.product, contents: (cart_item.contents if cart_item.contents.present?))
        end
      elsif difference.negative?
        @cart.cart_items.where(product: cart_item.product, contents: (cart_item.contents if cart_item.contents.present?)).limit(difference.abs).destroy_all
      end
    end

    @cart.total_price = @cart.products.sum(:price)
    set_quantities

    return redirect_to cart_path(@cart), notice: 'There was a problem. Cart was not updated.' unless @cart.save

    render turbo_stream: [
      turbo_stream.replace("cart_#{@cart.id}", partial: 'carts/cart', locals: { cart: @cart }),
      turbo_stream.prepend('flashes', partial: 'shared/flash', locals: { notice: 'Cart updated.' })
    ]
  end

  # DELETE /carts/1 or /carts/1.json
  def destroy
    old_cart_id = @cart.id
    @cart.destroy
    session[:cart_id] = nil
    set_cart

    render turbo_stream: [
      turbo_stream.replace("cart_#{old_cart_id}", partial: 'carts/cart', locals: { cart: @cart }),
      turbo_stream.prepend('flashes', partial: 'shared/flash', locals: { notice: 'Cart emptied.' })
    ]
  end

  private

  def set_cart
    # if current_user.cart.present?
    #   @cart = current_user.cart
    # else
    #   @cart = Cart.create(user: current_user)
    # end
    if session[:cart_id].present? && Cart.exists?(session[:cart_id])
      @cart = Cart.find(session[:cart_id])
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end

  def set_quantities
    @quantities = @cart.cart_items.group_by { |item| [item.product.id, item.contents] }.transform_values(&:count)
  end

  # Only allow a list of trusted parameters through.
  def cart_params
    params.require(:cart).permit(:total_price, :user_id)
  end
end
