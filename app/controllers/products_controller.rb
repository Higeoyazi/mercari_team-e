class ProductsController < ApplicationController

  before_action :authenticate_user! #マージする前に消すこと！

  def index
    @products = Product.all.order("created_at DESC").limit(4)
  end

  def show
  end
  
end