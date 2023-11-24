class HomeController < ApplicationController
  def index
    if current_user.completed
      redirect_to user_profile_path
    else
      redirect_to edit_user_registration_path
    end
  end
end
