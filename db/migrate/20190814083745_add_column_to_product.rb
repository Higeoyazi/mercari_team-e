class AddColumnToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :delivery_cost, :string
    add_column :products, :prep_days, :string
  end
end