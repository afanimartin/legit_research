class RegistrationsController < Devise::RegistrationsController
  private
    def sign_up_params
      params.require(:user).permit(:email, :password, :password_confirmation).merge(role_id: 2)
    end

    def account_update_params
      params.require(:user).permit(:bio, :avatar, :first_name, :last_name, :category_id, :current_password).merge(completed: true)
    end
end