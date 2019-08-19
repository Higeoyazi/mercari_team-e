class ProductsController < ApplicationController

  require 'payjp'
  before_action :set_product, only: [:edit, :show, :destroy, :update]

  def index
    @products = Product.all.order("created_at DESC").limit(4)
  end

  def show
  end

  def confirm
    set_product
    @address = current_user.address
    @profile = current_user.profile
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
      @product.update(product_params)
      redirect_to product_path(@product.id)
    end
  end

  def destroy
    # if @product.user_id == current_user.id
    #   @product.destroy
    # end
  end

  def search
    @products = Product.where('name LIKE(?)', "%#{params[:keyword]}%")
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end


  def pay
    product = Product.find(params[:id])
    credit_card = CreditCard.find_by(user_id: current_user.id)
    Payjp.api_key = Rails.application.credentials.development[:payjp_private_key]

    redirect_to controller: 'credit_cards', action: 'new' if credit_card.blank? #持ってないなら登録させる
    if Payjp::Charge.create(  amount: product.price,
                            customer: credit_card.customer_id,
                            currency: 'jpy')

        current_user.buy(product) #支払いが無事できたら購入のアクションを実行
        redirect_to action: 'pay_done' # 決済完了画面へ
    else
        redirect_to action: 'confirm' #クレジットカードエラー or payjp側のエラーの時
    end
  end


  def pay_done #購入完了画面へ
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