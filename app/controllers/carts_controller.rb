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
    product = Product.find(params[:product_id])
    quantity = params[:quantities][params[:product_id]].to_i

    quantity.times do
      @cart.products << product
      @cart.total_price += product.price
    end

    return redirect_to products_path, notice: 'Product was not added to cart.' unless @cart.save

    render turbo_stream: turbo_stream.prepend('flashes',
                                              partial: 'shared/flash',
                                              locals: { notice: "#{product.name} added to cart" })
  end

  def remove_from_cart
    product = Product.find(params[:product_id])
    @cart.products.delete(product)
    @cart.total_price -= product.price

    return redirect_to cart_path(@cart), notice: "#{product.name} was not removed from cart." unless @cart.save

    render turbo_stream: [
      turbo_stream.replace("cart_#{@cart.id}", partial: 'carts/cart', locals: { cart: @cart }),
      turbo_stream.prepend('flashes', partial: 'shared/flash', locals: { notice: "#{product.name} removed from cart" })
    ]
  end

  def update_cart
    params[:quantities].each do |product_id, quantity|
      product = Product.find(product_id)
      current_quantity = @cart.products.where(id: product_id).count
      difference = quantity.to_i - current_quantity

      if difference.positive?
        difference.times { @cart.products << product }
      elsif difference.negative?
        @cart.product_carts.where(product_id: product_id).limit(difference.abs).destroy_all
      end
    end

    @cart.total_price = @cart.products.sum(:price)
    set_quantities

    return redirect_to cart_path(@cart), notice: 'Product was not removed from cart.' unless @cart.save

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
    if session[:cart_id].present?
      @cart = Cart.find(session[:cart_id])
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end

  def set_quantities
    @quantities = @cart.products.group(:id).count
  end

  # Only allow a list of trusted parameters through.
  def cart_params
    params.require(:cart).permit(:total_price, :user_id)
  end
end
