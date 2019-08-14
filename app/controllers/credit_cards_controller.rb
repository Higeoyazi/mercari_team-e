class CreditCardsController < ApplicationController

  require 'payjp'

  def new
    @credit_card = current_user.credit_cards.new
  end

  def show #ユーザーの全てのクレジットカードを全て出す
    @credit_cards = CreditCard.where(user_id: current_user.id)
    redirect_to  action: 'new' if @credit_cards.blank?
    # redirect_to controller: "card", action: "new" if @credit_cards.blank?
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

  





  
end