class Order < ApplicationRecord
  # Association
  belongs_to :product
  belongs_to :seller, class_name: 'User'
  belongs_to :buyer, class_name: 'User'

  # Validation
  # 全てreferences型なので書く必要なし
end
