class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_order

  def configure_permitted_parameters
    update_attrs = [:password, :password_confirmation, :current_password]
    devise_parameter_sanitizer.permit :account_update, keys: update_attrs
  end

  def current_order
    if current_user
      if current_user.orders.exists?(user_id: current_user.id)
        Order.where(user_id: current_user.id).last
      else
        Order.new(user_id: current_user.id)
      end
    elsif !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  private

	def authorize
		redirect_to root_path if current_user.nil?
	end

	def authorize_admin
		if (current_user.nil?) || (not current_user.admin)
			redirect_to root_path
		end
	end
end
