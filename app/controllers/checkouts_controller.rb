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
      @checkout.set_gst(@order.subtotal, @order.gst)
      @checkout.order_id = @order.id

      if current_user
        @checkout.user_id = current_user.id
      end

      if @checkout.save
        session.delete(:order_id)
        session[:checkout_id] = @checkout.id

        # Creates a new order for the customer when they checkout
        # Saves old order record, which is referred to by the checkout record
        if current_user
          order = Order.new(user_id: current_user.id)
        else
          order = Order.new
        end
        order.save

        # Get the stripe payment token ID submitted by the form
        token = params[:stripeToken]

        if @checkout.create_charge(token)
          redirect_to @checkout
        else
          redirect_to "new"
        end
      else
        redirect_to "new"
      end
    end
  end

  private

  def checkouts_params
    params.require(:checkout).permit(:total, :first_name, :last_name, :email, :shipping_address, :shipping_suburb, :shipping_zip, :shipping_state,
      :billing_address, :billing_suburb, :billing_zip, :billing_state, :phone, :order_id, :user_id)
  end

  def find_order
    @order = Order.find_by_id(params[:order_id])
  end

  def find_checkout
    @checkout = Checkout.find_by_slug(params[:slug])
  end
end
