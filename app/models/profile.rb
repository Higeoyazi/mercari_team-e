class Profile < ApplicationRecord

  # Association
  belongs_to :user, optional: true


  # Validation
  validates :family_name,      presence: true, on: :validates_step3
  validates :first_name,       presence: true, on: :validates_step3
  validates :family_name_kana, presence: true, on: :validates_step3
  validates :first_name_kana,  presence: true, on: :validates_step3
  validates :phone_number,     uniqueness: true, on: :validates_step3

end
