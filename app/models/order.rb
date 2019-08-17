class Order < ApplicationRecord
  # Association
  belongs_to :buyer, class_name: 'User', :foreign_key => 'buyer_id'
  belongs_to :saler, class_name: 'User', :foreign_key => 'saler_id'
  belongs_to :product
end
