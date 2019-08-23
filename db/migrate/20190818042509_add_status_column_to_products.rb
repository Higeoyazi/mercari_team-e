class AddStatusColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :status, :integer, default: 0
    add_index :products, :status
  end
end
