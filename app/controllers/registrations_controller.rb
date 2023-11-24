class RegistrationsController < Devise::RegistrationsController
  def update_resource(resource, params)
    if resource.provider == 'google_oauth2'
      params.delete(:current_password)
      resource.update_without_password(params)
    else
      resource.update(params)
    end
  end


  private
    def account_update_params
      params.require(:user).permit(:bio, :gender, :date_of_birth, :category_id).merge(completed: true)
    end
end