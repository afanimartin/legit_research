class UsersController < ApplicationController
  def show
    @user = current_user
    @publications = @user.publications
  end
end
