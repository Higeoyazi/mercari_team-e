class CreditCard < ApplicationRecord
  # Association
  belongs_to :user, optional: true

  # Validation
  # validates :number,                uniqueness: true,
  #                                   presence: true, on: :step5
  # validates :expiration_date_month, presence: true, on: :step5
  # validates :expiration_date_year,  presence: true, on: :step5
  # validates :security_code,         presence: true, on: :step5


  validates :customer_id,  presence: true#, on: :step5
  validates :card_id,      presence: true#, on: :step5
end
