class CreditCardsController < ApplicationController

  require 'payjp'

  def new
    @credit_card = current_user.credit_cards.new
  end


  def show #ユーザーの全てのクレジットカードを全て出す
    credit_card = CreditCard.where(user_id: current_user.id).first
    if credit_cards.blank?
      redirect_to  action: 'new'
    else
      gets_key
      customer = Payjp::Customer.retrieve(credit_card.customer_id)
      @default_card_information = customer.cards.retrieve(credit_card.card_id)
      # デバッグ時 @default_card_informationの中身確認
    end
  end
  #シンプルにcredit_cardのレコードを作成するためのものであって、
  #トークンは別に作る、もしかしたら別のjsファイル必要かも,
  def create
    resister_payjp_customer(current_user)
  end


  def delete #PayjpとCredit_cardのデータを削除、destroyとは何が違うのか後で検証
    credit_card = CreditCard.find(params[:id])
    unless credit_card.blank?
      Payjp.api_key = Rails.application.credentials.development[:payjp_private_key]
      customer = Payjp::Customer.retrieve(credit_card.customer_id)
      customer.delete
      credit_card.delete
    end
    redirect_to action: 'new' #ここで飛ばす時にフラッシュいれるor消去完了のページに飛ばすのがいいかも
  end


  def pay
    @product = Product.find(params[:id]) #ここはparamsの引数の値間違っているかもしれないので後で確認。
    Payjp.api_key = Rails.application.credentials.development[:payjp_private_key]

    # 実際の挙動見て下記にするか決める
    # Payjp::Charge.create(
    #   amount: @product.price, # 買う商品の値段
    #   customer: credit_card.customer_id, # payjpに登録されているどの顧客情報(カード情報)を使うか。
    #   currency: 'jpy'
    # )
    # redirect_to action: 'done'

    pay = Payjp::Charge.new(
      amount: @product.price, # 買う商品の値段
      customer: credit_card.customer_id, # payjpに登録されているどの顧客情報(カード情報)を使うか。
      currency: 'jpy'
    )

    if pay.save
      redirect_to action: 'done'
    # else
      # ここに購入画面のビューをリダイレクト
    end
  end


  def done #完了画面
  end


  private

  
    def gets_key
      Payjp.api_key = Rails.application.credentials.development[:payjp_private_key]
    end

end