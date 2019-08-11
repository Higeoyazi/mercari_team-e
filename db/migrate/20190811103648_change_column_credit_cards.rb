class ChangeColumnCreditCards < ActiveRecord::Migration[5.2]
  def change
    remove_column :credit_cards, :expiration_date_month, :integer
    remove_column :credit_cards, :expiration_date_year, :integer
    remove_column :credit_cards, :security_code, :integer

    add_column :credit_cards, :customer_id, :string
    add_column :credit_cards, :card_id, :string
  end
end
