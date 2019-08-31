## users table

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false, unique: true|
|birthday|integer|null: false|
|avatar|string||
|introduce|text||

### Association
- has_one_attached :avatar
- has_many :orders
- has_many :products
- has_many :comments
- has_one :address, dependent: :destroy
- has_many :credit_cards, dependent: :destroy
- has_many :seller, class_name: 'Order'
- has_many :buyer, class_name: 'Order'




## profiles table
|Column|Type|Options|
|------|----|-------|
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
|seller|references|null: false, foreign_key: true|
|buyer|references|null: false, foreign_key: true|
|product|references|null: false, foreign_key: true|
### Association
- belongs_to :seller, class_name: 'User'
- belongs_to :buyer,  class_name: 'User'
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
|prep_days|string|null: false|
|delivery_cost|string|null: false|
|status|integer|null: false,default: 0|


### Association
- belongs_to :user
- has_one :order
- has_many :comments, dependent: :destroy
- has_many :product_images, dependent: :destroy
- belongs_to :category

## index
- add_index products, :name

## enum
- enum products, :status



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





## ER図
<img width="902" alt="ERforMercari" src="https://camo.githubusercontent.com/165d3347515e4791417ee48cb65dab9ce5387ca3/68747470733a2f2f692e6779617a6f2e636f6d2f35313966333031363331366439393563313563386333663239323336383563342e706e67">

Higeoyazi