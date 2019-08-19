class CreditCard < ApplicationRecord
  # Association
  belongs_to :user, optional: true

  validates :customer_id,  presence: true#, on: :step5
  validates :card_id,      presence: true#, on: :step5
end
