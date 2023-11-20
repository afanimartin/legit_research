class RegistrationsController < Devise::RegistrationsController
  # before_action :configure_permitted_parameters, if: :devise_controller?

  def update_resource(resource, params)
    if resource.provider == 'google_oauth2'

      params.delete(:current_password)

      # Assign 'bio' only if it's a permitted parameter
      # resource.bio = params[:bio] if params.key?(:bio)

      # Update the resource without password
      # resource.update_without_password(params)
      resource.update_without_password(params)
    else
      resource.update(params)
    end
  end


  private

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:bio)
    end
end