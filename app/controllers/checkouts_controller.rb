class CheckoutsController < ApplicationController

  before_action :find_checkout, only: [:show]
  before_action :find_order, only: [:new, :create]
  before_filter :authorize_admin, only: [:index]

  def index
    @checkouts = Checkout.all.order("created_at DESC")
  end

  def show
  end

  def new
    @checkout = Checkout.new
  end

  def create
    @checkout = Checkout.new(checkouts_params)

    if current_user
      @checkout.user_id = current_user.id
    end
    
    if @checkout.save
      redirect_to @checkout
    else 
      redirect_to :back
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
