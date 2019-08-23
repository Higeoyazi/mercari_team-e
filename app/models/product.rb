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
  belongs_to_active_hash :preparation
  belongs_to_active_hash :cost
  
  #validation
  VALID_NUMBER_REGEX = /[0-9]{8,10}/

  validates :name,              presence: true, length: {maximum: 40}
  validates :description,       presence: true, length: {maximum: 1000 }
  
  validates :price,             presence: true, numericality: {less_than: 999999, greater_than: 300}
  validates :quality,           presence: true
                                
  validates :delivery_origin,   presence: true
                                
  validates :delivery_cost,     presence: true
                                
  validates :prep_days,         presence: true
                                
  validates :category_id,       presence: true
  validates :user_id,           presence: true
  validates :product_images,    presence: true #この書き方でproduct_imagesをproductと一緒にbuildした時のproductのparamsの一つであるproduct_imagesのattributesがあるかどうかvalidしてくれる
end