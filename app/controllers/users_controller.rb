class UsersController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to edit_user_path(current_user.id)
  end
  
  private

  def user_params
    params.require(:user).permit(:nickname,:introduce,:avatar)
  end

end

