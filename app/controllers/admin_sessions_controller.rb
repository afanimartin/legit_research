class AdminSessionsController < ApplicationController
  def new
  end
  
  def create
    admin = Admin.find_by(email: params[:admin][:email])
    if admin && admin.authenticate(params[:admin][:password])
      # Successful admin login
      sign_in(:admin, admin)
      redirect_to Avo.configuration.root_path
    else
      # Failed login, handle error or redirect back to login form
    end
  end
end
