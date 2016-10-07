class SessionsController < ApplicationController

  def create
    user = User.find_by_credentials
    (params[:user][:email],params[:user][:password])

    if user.nil?
      flash.now[:errors] = ["Incorrect username and/or password"]
      render :new
    else
      log_in_user!(user)
      redirect_to user_url
    end
  end

  def new
    render :new
  end

end
