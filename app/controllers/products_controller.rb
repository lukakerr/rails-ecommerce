class ProductsController < ApplicationController

	before_action :find_product, only: [:show, :edit, :update, :destroy]
	before_filter :authorize_admin, only: [:new, :create, :edit, :update, :destroy]

	def index
		if params[:category].blank?
	        @product = Product.all.order("created_at DESC")
	    else
	        @category_id = Category.find_by(name: params[:category]).id
	        @product = Product.where(category_id: @category_id).order("created_at ASC")
	    end
	end

	def show
	end

	def new
		@product = current_user.products.build
	end

	def create
		@product = current_user.products.build(products_params)
		
		respond_to do |format|
			if @product.save

				if params[:images]
					params[:images].each { |image|
						@product.pictures.create(image: image, imageable_id: @product.id)
					}
				end

				format.html { redirect_to @product, notice: 'Product was successfully created.' }
				format.json { render json: @product, status: :created, location: @product }
			else
				format.html { render action: "new" }
				format.json { render json: @product.errors, status: :unprocessable_entity }
			end
		end
	end

	def edit
	end

	def update
		if @product.update(products_params)
			redirect_to @product 
		else
			render "edit"
		end
	end

	def destroy
		@product.destroy
		redirect_to root_path
	end

	private

	def products_params
		params.require(:product).permit(:name, :description, :price, :old_price, :on_sale, :quantity, :sold_out, :featured, :category_id, :pictures)
	end

	def find_product
		@product = Product.find(params[:id])
	end
end