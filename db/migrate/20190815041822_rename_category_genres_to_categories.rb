class RenameCategoryGenresToCategories < ActiveRecord::Migration[5.2]
  def change
    rename_table :category_genres, :categories
  end
end
