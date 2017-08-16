class OrdersController < ApplicationController

	before_action :find_order, only: [:show, :edit, :update, :destroy]
	before_action :authorize_admin, only: [:index, :edit, :update, :destroy]

	def index
		@order = Order.all.order("created_ad DESC")
	end

	def show
	end

	def new
		@order = current_user.orders.build
	end

	def create
		@order = current_user.orders.build(orders_params)

		if @order.save
			redirect_to @order
		else
			redirect_to "New"
	end

	def edit
	end

	def update
		if @order.update(orders_params)
			redirect_to @order 
		else
			render "Edit"
		end
	end

	def destroy
		@order.destroy
		redirect_to root_path
	end

	private

	def orders_params
		params.require(:order).permit(:total, :tax, :gst, :first_name, :last_name, :email, :address, :suburb, :zip, :state, :phone, :product_name, :product_id, :user_id)
	end

	def find_order
		@order = Order.find(params[:id])
	end
end
