class Product < ApplicationRecord
  # Association
  belongs_to :user
  has_one :order
  has_many :product_images, dependent: :destroy

  # has_many :categories
  # has_many :category_genres, through: :categories
  has_many :category_genres

  has_many :comments, dependent: :destroy
end
