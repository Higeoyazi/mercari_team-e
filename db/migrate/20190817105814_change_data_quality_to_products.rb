class ChangeDataQualityToProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :quality, :string
  end
end
