class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def update
    @user.avatar.attach(params [:user][:avatar]) if @user.avatar.blank?
  end

  def user_params
    params.require(:user).permit(:avatar)
  end



end
