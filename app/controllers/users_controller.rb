class UsersController < ApplicationController

  def index
    @users = User.all
  end
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in_user!(@user)
      redirect_to users_url
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  before_action :require_log_in
  def require_log_in
    if current_user.nil?
      redirect_to new_session_url
    end
  end

  private
  def user_params
    params.require(:user).permit(:email,:password)
  end
end
