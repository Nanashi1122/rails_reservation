class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @usesrs = User.all
  end

  def update
    @user.avatar.attach(params [:user][:avatar]) if @user.avatar.blank?
  end

  def user_params
    params.require(:user).permit(:avatar)
  end



end
