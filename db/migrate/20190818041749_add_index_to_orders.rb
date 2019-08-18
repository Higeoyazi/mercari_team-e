class AddIndexToOrders < ActiveRecord::Migration[5.2]
  def change
    add_index :orders, [:product_id, :seller_id, :buyer_id], unique: true
  end
end
