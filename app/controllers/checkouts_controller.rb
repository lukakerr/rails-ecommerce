class CheckoutsController < ApplicationController

  before_action :find_checkout, only: [:show]
  before_action :find_order, only: [:new, :create]
  before_filter :authorize_admin, only: [:index]

  def index
    @checkouts = Checkout.all.order("created_at DESC")
  end

  def show
    @order = Order.find_by_id(@checkout.order_id)
    @order_items = Order.find_by_id(@order.id).order_items
    @order_items.each do |order_item|
      @products = Product.where(id: order_item.product_id)
    end
  end

  def new
    @checkout = Checkout.new
  end

  def create
    @checkout = Checkout.new(checkouts_params)
    if @order.present?
      @order.tax ||= 1
      @order.gst ||= 1
      @order.save
      @checkout.total = @order.subtotal * @order.tax * @order.gst
      @checkout.order_id = @order.id

      if current_user
        @checkout.user_id = current_user.id
      end

      if @checkout.save
        session.delete(:order_id)
        # Creates a new order for the customer when they checkout
        # This saves the old order record, which is referred to by the checkout record
        if current_user
          order = Order.new(user_id: current_user.id)
          order.save
        else
          order = Order.new
          order.save
        end
        redirect_to @checkout
      else
        redirect_to "new"
      end
    end
  end

  private

  def checkouts_params
    params.require(:checkout).permit(:total, :first_name, :last_name, :email, :address, :suburb, :zip, :state, :phone, :order_id, :user_id)
  end

  def find_order
    @order = Order.find_by_id(params[:order_id])
  end

  def find_checkout
    @checkout = Checkout.find(params[:id])
  end

end
