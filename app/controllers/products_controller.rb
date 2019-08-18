class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :show, :destroy, :update]

  def index
    @products = Product.all.order("created_at DESC").limit(4)
  end

  def show
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

  def edit
  end

  def update
    if @product.user_id == current_user.id
      # binding.pry
      @product.update(product_params)
      redirect_to product_path(@product.id)
    end
  end

  def destroy
    if @product.user_id == current_user.id
      @tweet.destroy
    end
  end

  def search
    @products = Product.where('name LIKE(?)', "%#{params[:keyword]}%")
  end

private

  def set_product
    @product = Product.find(params[:id])
  end

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