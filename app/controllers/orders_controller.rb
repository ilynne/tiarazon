class OrdersController < ApplicationController

  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    if params[:commit] = 'confirm'
      @order.status = 'complete'
    else
      @order.status = nil
    end
    respond_to do |format|
      if @order.update(order_params) && params[:order][:email].present?
        ledger @order
        notice = "Thank you for your order!"
        session[:cart_id] = nil
        OrderMailer.order_confirmed(@order).deliver
        format.html { redirect_to @order, notice: notice }
        format.json { render :show, status: :ok, location: @order }
      else
        @order.errors.add(:email, "cannot be blank")
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def ledger order
      entry = Plutus::Entry.build(
                :description => "Tiarazon sale",
                :commercial_document => order,
                :debits => [
                  {:account => "Accounts Receivable", :amount => order.total }],
                :credits => [
                  {:account => "Sales Revenue", :amount => order.total * 0.2 },
                  {:account => "Accounts Payable", :amount => order.total * 0.8 }])
      entry.save
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:email, :status)
    end
end
