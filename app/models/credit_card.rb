class CreditCard < ApplicationRecord
  # Association
  belongs_to :user, optional: true

  # Validation
  validates :number,                presence: true,
                                    unique: true,   on: :validates_step4
  validates :expiration_date_month, presence: true, on: :validates_step4
  validates :expiration_date_year,  presence: true, on: :validates_step4
  validates :security_code,         presence: true, on: :validates_step4
end
