class AddColumnToCreditCard < ActiveRecord::Migration[5.2]
  def change
    add_column :credit_cards, :expiration_date_month, :integer
    rename_column :credit_cards, :expiration_date, :expiration_date_year
  end
end
