class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :shipping_address, :shipping_suburb, :shipping_zip, :shipping_state,
      :billing_address, :billing_suburb, :billing_zip, :billing_state, 
      :phone, :admin, :image, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :shipping_address, :shipping_suburb, :shipping_zip, :shipping_state,
      :billing_address, :billing_suburb, :billing_zip, :billing_state,
      :phone, :admin, :image, :email, :password, :password_confirmation, :current_password)
  end

  protected

  # def update_resource(resource, params)
  #   resource.update_without_password(params)
  # end

  # def after_update_path_for(resource)
  #   edit_user_registration_path
  # end
end