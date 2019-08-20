class Address < ApplicationRecord

  # Association
  belongs_to :user, optional: true

  # Validation
  VALID_POSTAL_REGEX = /\A\d{7}\z/ # ハイフンなし7桁

  validates :postal_code, presence: true, on: :step4,
                          format: { with: VALID_POSTAL_REGEX }
  validates :prefecture,  presence: true, on: :step4
  validates :city,        presence: true, on: :step4
  validates :block,       presence: true, on: :step4
end
