class OrdersController < ApplicationController

	before_action :find_order, only: [:new, :show, :edit, :update, :destroy]
	before_filter :authorize, only: [:index, :show]
	before_action :authorize_admin, only: [:index, :edit, :update, :destroy]

	def index
		@order = Order.all.order("created_at DESC")
	end

	def display
		@order = Order.all.order("created_at ASC")
	end

	def show
	end

	def new
	end

	def create
		@order = current_user.orders.build(orders_params)

		if @order.save
			redirect_to @order
		else
			redirect_to "new"
		end
	end

	private

	def orders_params
		params.require(:order).permit(:total, :tax, :gst, :first_name, :last_name, :email, :address, :suburb, :zip, :state, :phone, :product_name, :product_id, :user_id)
	end

	def find_order
		@order = Order.find_by_id(params[:order_id])
	end
end
