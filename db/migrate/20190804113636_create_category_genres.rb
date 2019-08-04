class CreateCategoryGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :category_genres do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
