class AddColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :category, foreign_key: true, null: false
  end
end
