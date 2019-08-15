class ProductsController < ApplicationController


  def index
    @products = Product.all.order("created_at DESC").limit(4)
  end

  def show
    @product = Product.find(params[:id])
  end
  
  def new
    @product = Product.new
    @product.product_images.build
    @product.categories.build
  end

  def create
    @product = current_user.products.build(product_params)
    unless @product.valid?
      render "/products/new"
    else
      @product.save
      redirect_to root_path
    end
  end

private
  def product_params
    params.require(:product).permit(
      :name,
      :description,
      :price,
      :quality,
      :delivery_origin,
      :delivery_status,
      :delivery_cost,
      :prep_days,
      product_images_attributes: [:id, :image_url],
      categories_attributes: [:id, :name]
    )
  end

  def search
    @products = Product.where('name LIKE(?)', "%#{params[:keyword]}%")
  end
end