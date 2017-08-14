class ProductsController < ApplicationController

	before_action :find_product, only: [:show, :edit, :update, :destroy]

	def index
		@product = Product.all.order("created_at DESC")
	end

	def show
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(products_params)

		if @product.save
			redirect_to @product 
		else
			render "New"
		end
	end

	def edit
	end

	def update
		if @product.update(products_params)
			redirect_to @product 
		else
			render "Edit"
		end
	end

	def destroy
		@product.destroy
		redirect_to root_path
	end

	private

	def products_params
		params.require(:product).permit(:name, :description, :price, :old_price, :on_sale, :quantity, :sold_out, :featured, :category_id)
	end

	def find_product
		@product = Product.find(params[:id])
	end
end