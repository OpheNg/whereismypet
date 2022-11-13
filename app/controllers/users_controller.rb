class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params_update)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:firstname,:address,:lastname,:email,:tel,:photo)
  end

  def user_params_update
    params.require(:user).permit(:firstname,:address,:lastname,:email,:tel,:photo)

    # this is a test
  end


end
