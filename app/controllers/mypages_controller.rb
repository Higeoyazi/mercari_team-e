class MypagesController < ApplicationController
  before_action :authenticate_user!
 
  def profile
  end

  def logout
  end
  
  def identification
    @profile = Profile.find_by(user_id: current_user)
    @address = Address.find_by(user_id: current_user)
  end

  def edition
  end

end
