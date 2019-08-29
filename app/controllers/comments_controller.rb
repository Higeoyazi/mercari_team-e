class CommentsController < ApplicationController

  before_action  :authenticate_user!
  before_action  :set_parents

  def create
    @product = Product.find(params[:id])
    @comment = @product.comments.new(comment_params)
    if @comment.valid?
      @comment.save
        respond_to do |format|
          format.html { redirect_to controller: 'products', action: 'show' }
          format.json
        end
    else
      @product = Product.find(params[:id])
      @comments = @product.comments
      render 'products/show'
    end
  end

  private

  def set_parents
    @parents = Category.where(ancestry: nil)
  end

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id)
  end
end
