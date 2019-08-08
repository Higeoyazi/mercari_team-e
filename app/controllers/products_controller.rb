class ProductsController < ApplicationController

  def index
    @products = Product.all.order("created_at DESC").limit(4)
  end

end