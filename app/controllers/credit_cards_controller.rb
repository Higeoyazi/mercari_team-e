class CreditCardsController < ApplicationController

  require 'payjp'

  def index #ユーザーの全てのクレジットカードを全て出す
    credit_cards = CreditCard.where(user_id: current_user.id)
    if credit_cards.blank?
      redirect_to  action: 'new'
    else
      gets_key
      customer = Payjp::Customer.retrieve(credit_card.customer_id)
      @default_card_information = customer.cards.retrieve(credit_card.card_id)
      # デバッグ時 @default_card_informationの中身確認
    end
  end


  def new
    @credit_card = current_user.credit_cards.new
  end
  #シンプルにcredit_cardのレコードを作成するためのものであって、
  #トークンは別に作る、もしかしたら別のjsファイル必要かも,
  
  def create
    resister_payjp_customer(current_user)
    # 本物は上記の後フラッシュ[success]と共にaction: 'show'に飛ばす
  end


  def destroy #PayjpとCredit_cardのデータを削除、destroyとは何が違うのか後で検証
    credit_card = CreditCard.find(params[:id])
    unless credit_card.blank?
      gets_key
      customer = Payjp::Customer.retrieve(credit_card.customer_id)
      customer.delete
      credit_card.delete
    end
    redirect_to action: 'new' #ここで飛ばす時にフラッシュいれるor消去完了のページに飛ばすのがいいかも
  end


  private


  def gets_key
    Payjp.api_key = Rails.application.credentials.development[:payjp_private_key]
  end

end