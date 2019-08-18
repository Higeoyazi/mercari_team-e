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

  has_many :bought_orders, class_name: 'Order',
                           foreign_key: 'buyer_id',
                           dependent: :destroy
  has_many :sold_orders, class_name: 'Order',
                         foreign_key: 'seller_id',
                         dependent: :destroy

  has_many :bought, through: :bought_orders, source: :product
  has_many :sold, through: :sold_orders, source: :product

  has_one_attached :avatar
  has_many :products
  has_many :comments
  has_many :sns_credentials
  has_many :credit_cards, dependent: :destroy



  # Validation
  VALID_EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :nickname,              presence: true, length: {maximum: 20}, on: :step2
  validates :email,                 presence: true, uniqueness: true,
                                    format: { with: VALID_EMAIL_REGEX }, on: :validates_step2
  validates :password,              presence: true, length: {minimum: 6, maximum: 128}, on: :step2
  validates :password_confirmation, presence: true, length: {minimum: 6, maximum: 128}, on: :step2



  # Sign_up OR Login with FB or Google
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
        user = User.new(
          nickname: auth.info.name,
          email:    auth.info.email,
          )
      end
    end

    return user
  end
end
