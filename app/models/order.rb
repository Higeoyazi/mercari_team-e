class Order < ApplicationRecord
  # Association
  belongs_to :user
  belongs_to :product
end
