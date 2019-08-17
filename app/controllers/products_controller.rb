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

  def search
    @products = Product.where('name LIKE(?)', "%#{params[:keyword]}%")
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to root_path
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
      :category_id,
      product_images_attributes: [:id, :image_url]
    )
  end

end