class BannersController < ApplicationController

	before_action :find_banner, only: [:show, :edit, :update, :destroy]
	before_filter :authorize_admin, only: [:new, :create, :edit, :update, :destroy]

	def index
		@banner = Banner.all.order("created_at DESC")
	end

	def display
		@banner = Banner.all.order("created_at DESC")
	end

	def show
	end

	def new
		@banner = current_user.banners.build
	end

	def create
		@banner = current_user.banners.build(banners_params)

		respond_to do |format|
			if @banner.save

				if params[:images]
					params[:images].each do |image|
						@banner.pictures.create(image: image, imageable_id: @banner.id)
					end
				end

				format.html { redirect_to @banner, notice: 'Banner was successfully created.' }
				format.json { render json: @banner, status: :created, location: @banner }
			else
				format.html { render action: "new" }
				format.json { render json: @banner.errors, status: :unprocessable_entity }
			end
		end
	end

	def edit
	end

	def update
		if @banner.update(banners_params)
			redirect_to root_path 
		else
			render "edit"
		end
	end

	def destroy
		@banner.destroy
		redirect_to root_path
	end

	private

	def banners_params
		params.require(:banner).permit(:name, :pictures)
	end

	def find_banner
		@banner = Banner.find(params[:id])
	end
end
