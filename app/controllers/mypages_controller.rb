class MypagesController < ApplicationController
  before_action :authenticate_user!
 
  def profile
  end

  def logout
  end
  
  def identification
  end

end
