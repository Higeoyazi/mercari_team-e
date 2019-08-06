class Category < ApplicationRecord
  # Association
  belongs_to :products
  belongs_to :category_genre
end
