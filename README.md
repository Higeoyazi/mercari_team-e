## users table
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false, unique: true|
|birthday|integer|null: false|
|avatar|string||

### Association
- has_one_attached :avatar
- has_many :buyer_transactions, class_name: 'Transaction', :foreign_key => 'buyer_id'
- has_many :seller_transactions, class_name: 'Transaction', :foreign_key => 'seller_id'
- has_many :products
- has_many :comments
- has_one :profile, dependent: :destroy
- has_one :address, dependent: :destroy
- has_many :credit_cards, dependent: :destroy




## profiles table
|Column|Type|Options|
|------|----|-------|
|profile|text||
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|phone_number|integer|null: false, unique: true|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user




## addresses table
|Column|Type|Options|
|------|----|-------|
|postal_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|block|string|null: false|
|building|string||
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user




## credit_cards table
|Column|Type|Options|
|------|----|-------|
|customer_id|string|null: false|
|card_id|string|null: false|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user




## sns_credentials table
|Column|Type|Options|
|------|----|-------|
|uid|string|null: false|
|provider|string|null: false|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product




## Orders table
|Column|Type|Options|
|------|----|-------|
|saler|class_name|null: false, foreign_key: true|
|buyer|class_name|null: false, foreign_key: true|
|product|references|null: false, foreign_key: true|

### Association
- belongs_to :buyer, class_name: 'User', :foreign_key => 'buyer_id'
- belongs_to :seller, class_name: 'User', :foreign_key => 'seller_id'
- belongs_to :product




## products table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|description|text|null: false|
|price|integer|null: false|
|size|integer|null: false|
|brand_name|string|null: false|
|quality|string|null: false|
|delivery_origin|string|null: false|
|delivery_status|integer|default: 0|
|user|references|null: false,foreign_key: true|
|category|references|null: false,foreign_key: true|

### Association
- belongs_to :user
- has_one :order
- has_many :comments, dependent: :destroy
- has_many :product_images, dependent: :destroy
- belongs_to :category

## index
- add_index products, :name




## products_images table
|Column|Type|Options|
|------|----|-------|
|image_url|string|null: false|
|product|references|null: false,foreign_key: true|

### Association
- belongs_to :product




## categories table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||

### Association
- has_many :products
- has_ancestry

## index
- add_index categories, :ancestry




## comments table
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user|references|null: false,foreign_key: true|
|product|references|null: false,foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product

## enum
- enum products, :size
- enum products, :quality
- enum products, :delivery_status




## ER図
<img width="902" alt="ERforMercari" src="https://camo.githubusercontent.com/5a2985f6181823767228ada398f322c44438db1e/68747470733a2f2f692e6779617a6f2e636f6d2f66623038663561333339333964346231623165666662383063633238343264342e706e67">
