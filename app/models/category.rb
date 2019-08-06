class Category < ApplicationRecord
  belongs_to :products
  belongs_to :category_genre
end
