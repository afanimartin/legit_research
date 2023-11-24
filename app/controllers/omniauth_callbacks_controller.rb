class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    user = User.from_omniauth(auth)
    if user.present?
      sign_out_all_scopes
      flash[:success] = t 'devise.omniauth_callbacks.success', kind: 'Google'
      if user.completed
        sign_in_and_redirect user, event: :authentication
      else
        redirect_to complete_profile_path and return
      end
    else
      flash[:alert] =
        t 'devise.omniauth_callbacks.failure', kind: 'Google', reason: "#{auth.info.email} is not authorized."
      redirect_to new_user_session_path
    end
  end


  protected
  def after_omniauth_failure_path_for(_scope)
    new_user_session_path
  end
  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || user_profile_path
  end


  private
  def auth
    @auth ||= request.env['omniauth.auth']
  end
end