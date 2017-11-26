class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:contact_success] = 'Thank you for your message. We will contact you soon!'
      flash.keep
      redirect_to :back
    else
      flash.now[:alert] = 'There was an error sending your message. Please try again.'
      render '_contact_form'
    end
  end
end