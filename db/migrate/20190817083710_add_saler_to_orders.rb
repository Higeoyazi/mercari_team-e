class AddSalerToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :saler_id, :integer
    add_column :orders, :buyer_id, :integer
  end
end
