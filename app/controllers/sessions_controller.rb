class SessionsController < ApplicationController
  def new
  end
  def create
    @user = User.find_by_username(params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to dashboard_path, notice: "Success"
    else
      render "new"
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "Success"
  end
end
