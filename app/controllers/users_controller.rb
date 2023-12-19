class UsersController < ApplicationController
  def home
  end

  def index
    @users = User.all
    @rooms = Room.all
  end

  def show
    @users = User.all
  end

  def update
    @user.avatar.attach(params [:user][:avatar]) if @user.avatar.blank?
  end

  def user_params
    params.require(:user).permit(:avatar)
  end



end
