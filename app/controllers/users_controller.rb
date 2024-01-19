class UsersController < ApplicationController
  def show
    if current_user
      @user = current_user
      @publications = @user.publications.order(:created_at => :desc)
    end
  end
end
