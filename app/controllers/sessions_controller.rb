class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_user_name(params[:user_name])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to pictures_path
      else
        flash.now.alert = "User name or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
