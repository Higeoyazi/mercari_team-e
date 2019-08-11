class Profile < ApplicationRecord

  # Association
  belongs_to :user, optional: true

  # Validation
  validates :family_name,      presence: true, on: :step4
  validates :first_name,       presence: true, on: :step4
  validates :family_name_kana, presence: true, on: :step4
  validates :first_name_kana,  presence: true, on: :step4
  validates :phone_number,     presence: true, on: :step4,
                               uniqueness: true
end
