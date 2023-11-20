class UsersController < ApplicationController
  def index 
    
  end

  def show
    @user = current_user
    @publications = current_user.publications
  end
end
