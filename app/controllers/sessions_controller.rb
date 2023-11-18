class SessionsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    user = User.find_by(email: auth.info.email)

    if user
      # user exists, sign them in
      session[:user_id] = user.id
      redirect_to user, notice: "Signed in successfully!"
    else
      # user doesn't exist, create them
      new_user = User.create(email: auth.info.email, name: auth.info.name)

      if new_user.persisted?
        # new user created, sign them in
        session[:user_id] = new_user.id
        redirect_to new_user, notice: "Account created and signed in!"
      else
        redirect_to sessions_path, notice: "Failed to sign in. Please try again."
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to sessions_path, notice: "Signed out successfully!"
  end
end
