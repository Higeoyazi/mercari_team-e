class Address < ApplicationRecord

  # Association
  belongs_to :user, optional: true

  # Validation
  validates :postal_code, presence: true, on: :step4
  validates :prefecture,  presence: true, on: :step4
  validates :city,        presence: true, on: :step4
  validates :block,       presence: true, on: :step4
end
