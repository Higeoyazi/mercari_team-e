class ChangeTypeToProduct < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :quality, :string, null: false, default: 0
  end
end
