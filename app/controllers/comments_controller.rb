class CommentsController < ApplicationController

  before_action  :authenticate_user!

  def create
    product = Product.find(params[:id])
    product.comments.create(comment_params)
    redirect_to controller: 'products', action: 'show'
  end

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id)
  end
end
