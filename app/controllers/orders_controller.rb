class OrdersController < ApplicationController

	before_action :find_order, only: [:new, :show, :edit]
	before_filter :authorize, only: [:index, :show]
	before_action :authorize_admin, only: [:index, :edit]
	# before_action :authorize_order_user, only: [:new, :show, :edit]

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
		@order = current_order
		rescue ActiveRecord::RecordNotFound
    	redirect_to root_url
	end

	# def authorize_order_user
	# 	if current_user != Order.find(params[:id]).user
	#     redirect_to root_path
	#   else
	#   	@order = Order.find(params[:id])
	# 	end
	# end

end
