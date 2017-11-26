class PagesController < ApplicationController
  before_action :find_page, only: [:edit, :update, :destroy, :show]
  before_filter :authorize_admin, only: [:edit, :update, :destroy, :new, :create]

  def index
    @page = Page.order("position")
  end

  def new
    @page = Page.new
  end

  def create
    @page = current_user.pages.build(pages_params)
    
    if @page.save
      redirect_to @page
    else
      render 'new'
    end
  end
  
  def show
    @contact = Contact.new
  end

  def edit; end

  def update
    if @page.update(pages_params)
      redirect_to @page
    else
      render 'edit'
    end
  end

  def destroy
    @page.destroy
    redirect_to pages_path
  end
  
  def sort
    params[:page].each_with_index do |id, index|
      Page.where(id: id).update_all(position: index + 1)
    end
    render nothing: true
  end

    private

  def pages_params
    params.require(:page).permit(:name, :content, :contact_form, :image, :published, :position)
  end

  def find_page
    if current_user && current_user.admin
      @page = Page.find_by_slug(params[:slug])
    else
      @page = Page.published.find_by_slug(params[:slug])
    end
  end
  
end
