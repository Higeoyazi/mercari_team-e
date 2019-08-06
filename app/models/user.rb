class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  

  # Association
  has_one :profile, dependent: :destroy
  has_one :address, dependent: :destroy
  has_one_attached :avatar
  has_many :credit_cards, dependent: :destroy
  has_many :orders
  has_many :products
  has_many :comments

  # Validation
  validates :nickname, presence: true
  validates :birthday, presence: true

end
