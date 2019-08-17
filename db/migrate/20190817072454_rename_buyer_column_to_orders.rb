class RenameBuyerColumnToOrders < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :buyer_id, :user_id
  end
end
