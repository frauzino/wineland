class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update destroy]
  before_action :ensure_admin, only: %i[index edit update destroy]
  before_action :ensure_access_to_order, only: %i[show]

  def index
    @orders = Order.all
  end

  def show
    uniq_items = @order.order_items.uniq { |item| [item.product.id, item.contents] }

    @line_items = uniq_items.map do |item|
      { product: item.product, contents: item.contents, quantity: @order.order_items.where(product: item.product, contents: item.contents).count}
    end
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to order_url(@order), notice: 'Thank you for your order.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_url(@order), notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:total_price, :user_id)
  end
end
