class Product < ApplicationRecord
  # Association
  belongs_to :user
  has_one :order
  has_many :product_images, dependent: :destroy
  accepts_nested_attributes_for :product_images, allow_destroy: true
  has_many :categories
  accepts_nested_attributes_for :categories
  has_many :comments, dependent: :destroy
end