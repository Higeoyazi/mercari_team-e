class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_parents
  
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    flash[:notice] = "編集しました"
    redirect_to edit_user_path(current_user.id)
  end
  
  private

  def user_params
    params.require(:user).permit(:nickname,:introduce,:avatar)
  end

  def set_parents
    @parents = Category.where(ancestry: nil)
  end

end

