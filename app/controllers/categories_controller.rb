class CategoriesController < ApplicationController

	before_action :find_category, only: [:edit, :update, :destroy]
	before_filter :authorize_admin

	def index
		@category = Category.all.order("created_at ASC")
	end

	def new
		@category = current_user.categories.build
	end

	def create
		@category = current_user.categories.build(categories_params)

		if @category.save
			redirect_to categories_path 
		else
			render "New"
		end
	end

	def edit
	end

	def update
		if @category.update(categories_params)
			redirect_to categories_path
		else
			render "Edit"
		end
	end

	def destroy
		@category.destroy
		redirect_to categories_path
	end

	private

	def categories_params
		params.require(:category).permit(:name, :user_id)
	end

	def find_category
		@category = Category.find(params[:id])
	end

end
