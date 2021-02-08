class UsersController < ApplicationController

  before_action :authenticate_user!

  before_action :ensure_correct_user, only: [:edit, :update]

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to home_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :mail)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to root_path
    end
  end

end
