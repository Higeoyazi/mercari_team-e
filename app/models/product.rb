class Product < ApplicationRecord
  # Association
  belongs_to :user

  has_one :order
  # 0は購入可の状態、1は購入不可の状態
  enum status: {sell: 0, sold: 1}
  
  has_many :product_images, dependent: :destroy
  accepts_nested_attributes_for :product_images, allow_destroy: true

  belongs_to :category
  accepts_nested_attributes_for :category
  
  has_many :comments, dependent: :destroy
  #ActiveHashのAssociation
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :condition
  #validation
  VALID_CHOICE_REGEX = /\A[ぁ-んァ-ン一-龥]/ #全角ひらがな、全角カタカナ、漢字のみ

  validates :name,              presence: true, length: {maximum: 40}
  validates :description,       presence: true, length: {maximum: 1000 }
  validates :price,             presence: true, numericality: {less_than: 999999, greater_than: 300}
  validates :category_id,       presence: true
  validates :quality,           presence: true,
                                format: { with: VALID_CHOICE_REGEX},on: :new
  validates :delivery_origin,   presence: true,
                                format: { with: VALID_CHOICE_REGEX},on: :new
  validates :delivery_cost,     presence: true,
                                format: { with: VALID_CHOICE_REGEX},on: :new
  validates :prep_days,         presence: true,
                                format: { with: VALID_CHOICE_REGEX},on: :new
end