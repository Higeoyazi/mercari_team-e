class Category < ApplicationRecord
  # Association
  has_many :products
  has_ancestry
end
