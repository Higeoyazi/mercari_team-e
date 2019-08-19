class Profile < ApplicationRecord

  # Association
  belongs_to :user, optional: true

  # Validation
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/ # 0桁か11桁の数字(ハイフンなし)
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/ #全角ひらがな、全角、漢字
  VALID_NAME_KANA_REGEX = /[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+/ # 全角カタカナのみ

  validates :family_name,      presence: true, on: :step4,
                               format: { with: VALID_NAME_REGEX }
  validates :first_name,       presence: true, on: :step4,
                               format: { with: VALID_NAME_REGEX }
  validates :family_name_kana, presence: true, on: :step4,
                               format: { with: VALID_NAME_KANA_REGEX }
  validates :first_name_kana,  presence: true, on: :step4,
                               format: { with: VALID_NAME_KANA_REGEX }
  validates :phone_number,     presence: true, on: :step4,
                               uniqueness: true,
                               format: { with: VALID_EMAIL_REGEX }
end
