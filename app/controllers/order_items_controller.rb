class OrderItemsController < ApplicationController
  layout 'tiarazon'
  before_action :set_order_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index]

  # GET /order_items
  # GET /order_items.json
  def index
    @order_items = OrderItem.all
  end

  # GET /order_items/1
  # GET /order_items/1.json
  def show
    # @order_item.product = Product.find(@order_item.product_id)
  end

  # GET /order_items/new
  def new
    build_order unless session[:cart_id].present?
    @order_item = OrderItem.new
    @order_item.order_id = session[:cart_id]
  end

  # GET /order_items/1/edit
  def edit
  end

  # POST /order_items
  # POST /order_items.json
  def create
    # build_order unless session[:cart_id].present?
    # @order_item.order_id = session[:cart_id]
    flash[:notice] = params.inspect
    # redirect_to products_path
    # @order = build_order
    # @order_item.order_id = @order.id
    build_order unless session[:cart_id].present?
    @order_item = OrderItem.new(order_item_params)
    @order_item.order_id = session[:cart_id]

    respond_to do |format|
      if @order_item.save
        format.html { redirect_to order_path(session[:cart_id]), notice: 'Order item was successfully created.' }
        format.json { render :show, status: :created, location: @order_item }
      else
        format.html { render :new }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_items/1
  # PATCH/PUT /order_items/1.json
  def update
    respond_to do |format|
      if @order_item.update(order_item_params)
        format.html { redirect_to @order_item, notice: 'Order item was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_item }
      else
        format.html { render :edit }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_items/1
  # DELETE /order_items/1.json
  def destroy
    @order_item.destroy
    respond_to do |format|
      format.html { redirect_to order_items_url, notice: 'Order item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #cart scope

  def add_to_cart
    # session[:cart_id][:]
    @cart.order_items << OrderItem.new(order_item_params)
  end

  def update_in_cart
    delete_order_item params['order_item']['cart_index'].to_i
    @cart.order_items << OrderItem.new(order_item_params)
  end

  def remove_from_cart
    delete_order_item params[:id].to_i
  end

  private

  def delete_order_item(index)
    items = @cart.order_items.to_ary
    items.delete_at index
    @cart.order_items.replace items
  end

  private

    def build_order
      @order = Order.new
      @order.save
      session[:cart_id] = @order.id
      # self.order_id = @order.id
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end

    # def set_product product_id
    #   @order_item.product = Product.find(product_id)
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_item_params
      params.require(:order_item).permit(:order_id, :product_id, :quantity, :price, order_attributes: [:email])
    end
end
