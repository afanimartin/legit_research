class UsersController < ApplicationController
  def show
    # if current_user
      @user = User.find(params[:id])
      @publications = @user.publications.order(:created_at => :desc)
    # end
  end
end
