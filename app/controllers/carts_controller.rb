class CartsController < ApplicationController
  before_action :set_cart, only: %i[ show edit update destroy add_to_cart ]

  # GET /carts or /carts.json
  def index
    @carts = Cart.all
  end

  # GET /carts/1 or /carts/1.json
  def show
    @quantities = @cart.products.group(:id).count
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

    respond_to do |format|
      if @cart.save
        format.html { redirect_to cart_url(@cart), notice: "Cart was successfully created." }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1 or /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to cart_url(@cart), notice: "Cart was successfully updated." }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_to_cart
    product = Product.find(params[:product_id])
    @cart.products << product
    @cart.total_price += product.price
    # @cart = Cart.find(session[:cart_id])

    if @cart.save
      redirect_to products_path, notice: 'Product was successfully added to cart.'
    else
      redirect_to products_path, notice: 'Product was not added to cart.'
    end
  end

  def remove_from_cart
    product = Product.find(params[:product_id])
    @cart.products.delete(product)
    @cart.total_price -= product.price

    if @cart.save
      redirect_to cart_path(@cart), notice: 'Product was successfully removed from cart.'
    else
      redirect_to cart_path(@cart), notice: 'Product was not removed from cart.'
    end
  end

  # DELETE /carts/1 or /carts/1.json
  def destroy
    @cart.destroy

    respond_to do |format|
      format.html { redirect_to carts_url, notice: "Cart was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  # def set_cart
  #   @cart = Cart.find(params[:id])
  # end

  def set_cart
    if session[:cart_id].present?
      @cart = Cart.find(session[:cart_id])
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end

  # Only allow a list of trusted parameters through.
  def cart_params
    params.require(:cart).permit(:total_price, :user_id)
  end
end
