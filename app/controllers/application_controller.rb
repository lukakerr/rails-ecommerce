class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

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
