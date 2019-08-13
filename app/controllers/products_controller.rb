class ProductsController < ApplicationController


  def index
    # binding.pry
    @products = Product.all.order("created_at DESC").limit(4)
  end

  def show
  end
  
end