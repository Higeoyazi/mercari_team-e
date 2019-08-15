class ChangeColumnToProduct < ActiveRecord::Migration[5.2]
  def up
    change_column :products, :size, :integer, null: true, default: 0
    change_column :products, :brand_name, :string, null: true, default: 0
  end

  def down
    change_column :products, :size, :integer, null: false, default: 0
    change_column :products, :brand_name, :string, null: false, default: 0
  end
end
