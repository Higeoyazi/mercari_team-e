class Product < ApplicationRecord
  # Association
  belongs_to :user
  has_one :order
  
  has_many :product_images, dependent: :destroy
  accepts_nested_attributes_for :product_images, allow_destroy: true

  belongs_to :category
  accepts_nested_attributes_for :category
  
  has_many :comments, dependent: :destroy
end