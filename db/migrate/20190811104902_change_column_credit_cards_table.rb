class ChangeColumnCreditCardsTable < ActiveRecord::Migration[5.2]
  def change
    change_column_null :credit_cards, :customer_id, null: false
    change_column_null :credit_cards, :card_id, null: false
  end
end
