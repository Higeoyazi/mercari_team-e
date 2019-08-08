class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  

  # Association
  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address
  has_one_attached :avatar
  has_many :credit_cards, dependent: :destroy
  accepts_nested_attributes_for :credit_cards
  has_many :orders
  has_many :products
  has_many :comments
  has_many :sns_credentials

  # Validation
  validates :nickname, presence: true
  # validates :birthday, presence: true, length: { is: 8 }


  # Sign_up & Login with FB or Google
  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    if snscredential.present?
      user = User.where(id: snscredential.user_id).first
    else
      user = User.where(email: auth.info.email).first
      if user.present?
        SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
          )
      else
        user = User.create(
          nickname: auth.info.name,
          email:    auth.info.email,
          password: Devise.friendly_token[0, 20],
          # birthday: 19920101
          )
        SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
          )
      end
    end
    return user
  end
end
