class RemoveUserFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :user_id, :ineger
  end
end
