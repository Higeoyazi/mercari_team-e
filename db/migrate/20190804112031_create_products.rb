class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false, index: true
      t.text :description, null: false
      t.integer :price, null: false
      t.integer :size, null: false
      t.string :brand_name, null: false

      t.integer :quality, null: false
      t.string :delivery_origin, null: false
      t.integer :delivery_status, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
