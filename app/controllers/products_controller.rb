class ProductsController < ApplicationController

  require 'payjp'
  before_action :set_product, only: [:edit, :show, :destroy, :update]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_parents, only: [:index, :show,:search]

  def index
    @products_ladies      = Product.where(category_id: 1).order("created_at DESC").limit(4)
    @products_mens        = Product.where(category_id: 200).order("created_at DESC").limit(4)
    @products_kids        = Product.where(category_id: 346).order("created_at DESC").limit(4)
    @products_interior    = Product.where(category_id: 481).order("created_at DESC").limit(4)
    @products_hobby       = Product.where(category_id: 623).order("created_at DESC").limit(4)
    @products_toy         = Product.where(category_id: 682).order("created_at DESC").limit(4)
    @products_cosmetic    = Product.where(category_id: 795).order("created_at DESC").limit(4)
    @products_electric    = Product.where(category_id: 895).order("created_at DESC").limit(4)

  end

  def show
    set_product
    @comment = Comment.new
    @comments = @product.comments
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
    @product = Product.new(product_params)
    if @product.valid?
      @product.save
      flash[:notice] = "出品しました"
      redirect_to root_path
    else
      @product.product_images.build #validに引っかかった際、画像なしの状態の入力データを持ち越してrenderで元の画面に戻るので、もう一度buildしてproductsにproducts_imagesを持たせてあげないと、fields_forによるformが消えてしまう。
      flash[:alert] = "出品できませんでした"
      render new_product_path(@product)
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
    if @product.user_id == current_user.id
      @product.destroy
      redirect_to root_path
    end
  end

  def search
    search_keywords = params[:keyword]
    @products = Product.where('name LIKE(?)', "%#{search_keywords}%")
    @search_keywords = search_keywords
  end

  def destroy
    @product.destroy
    flash[:notice] = "削除しました"
    redirect_to root_path
  end


  def category
    @children = Category.find(params[:parent_id]).children
    respond_to do |format|
      format.json
    end
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
    ).merge(user_id: current_user.id)
  end

  def set_parents
    @parents = Category.where(ancestry: nil)
  end
end