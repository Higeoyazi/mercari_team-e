class CategoryGenre < ApplicationRecord
  # Association
  # has_many :categories
  # has_many :products, through: :categories
  has_many :products
  has_ancestry
end
