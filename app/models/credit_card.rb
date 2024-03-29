class CreditCard < ApplicationRecord
  # Association
  belongs_to :user, optional: true
  
  # Validation
  validates :customer_id,  presence: true#, on: :step5
  validates :card_id,      presence: true#, on: :step5

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :exp_month
  belongs_to_active_hash :exp_year
end
