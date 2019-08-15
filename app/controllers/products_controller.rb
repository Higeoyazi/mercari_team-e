class ProductsController < ApplicationController


  def index
    @products = Product.all.order("created_at DESC").limit(4)
  end

  def show
    @product = Product.find(params[:id])
  end
  
  def new
    @product = Product.new
  end

  def search
    @products = Product.where('name LIKE(?)', "%#{params[:keyword]}%")
  end
end