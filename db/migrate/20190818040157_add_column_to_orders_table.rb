class AddColumnToOrdersTable < ActiveRecord::Migration[5.2]
  def change
     add_reference :orders, :seller, foreign_key: { to_table: :users }
     add_reference :orders, :buyer, foreign_key: { to_table: :users }
  end
end
