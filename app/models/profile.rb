class Profile < ApplicationRecord

  # Association
  belongs_to :user, optional: true

  # Validation
  validates :family_name,      presence: true, on: :validates_step2
  validates :first_name,       presence: true, on: :validates_step2
  validates :family_name_kana, presence: true, on: :validates_step2
  validates :first_name_kana,  presence: true, on: :validates_step2
  validates :phone_number,     presence: true, on: :validates_step2,
                               uniqueness: true

end
