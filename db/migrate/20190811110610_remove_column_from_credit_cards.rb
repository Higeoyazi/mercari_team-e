class RemoveColumnFromCreditCards < ActiveRecord::Migration[5.2]
  def change
    remove_column :credit_cards, :number, :string
  end
end
