class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!

  protected

  def sign_in_params
    params.require(:user).permit(:username, :email, :password)
  end

  def sign_up_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
  
  def account_update_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :current_password)
  end
  
end