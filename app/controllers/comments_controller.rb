class CommentsController < ApplicationController

  before_action  :authenticate_user!

  def create
    @product = Product.find(params[:id])
    @comment = @product.comments.new(comment_params)
    if @comment.valid?
      @comment.save
      redirect_to controller: 'products', action: 'show'
    else
      @product = Product.find(params[:id])
      @comments = @product.comments
      render 'products/show'
    end
  end

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id)
  end
end
