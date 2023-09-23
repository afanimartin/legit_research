class RegistrationsController < Devise::RegistrationsController
  private
    def sign_up_params
      params.require(:freelancer).permit(:email, :password, :password_confirmation).merge(role_id: 2)
    end

    def account_update_params
      params.require(:freelancer).permit(:bio, :avatar, :first_name, :last_name, :phone, :location_id, :category_id, :current_password).merge(completed: true)
    end
end