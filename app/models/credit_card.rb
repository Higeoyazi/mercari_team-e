class CreditCard < ApplicationRecord
  # Association
  belongs_to :user, optional: true

  # Validation
  validates :number,                uniqueness: true,
                                    presence: true, on: :validates_step5
  validates :expiration_date_month, presence: true, on: :validates_step5
  validates :expiration_date_year,  presence: true, on: :validates_step5
  validates :security_code,         presence: true, on: :validates_step5
end
