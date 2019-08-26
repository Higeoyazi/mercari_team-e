class MypagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_parents

  def profile
  end

  def logout
  end
  
  def identification
  end

  private

  def set_parents
    @parents = Category.where(ancestry: nil)
  end

end
