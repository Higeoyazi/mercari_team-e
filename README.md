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
- has_many :orders
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
|phone_number|string|null: false, unique: true|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user




## addresses table

|Column|Type|Options|
|------|----|-------|
|prefecture|string|null: false|
|city|string|null: false|
|block|string|null: false|
|building|string|null: false|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user




## credit_cards table

|Column|Type|Options|
|------|----|-------|
|number|integer|null: false, unique: true|
|expiration_date|integer|null: false|
|security_code|integer|null: false, unique: true|
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :user




## Orders table
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|product|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :product



## products table

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|description|text|null: false|
|price|integer|null: false|
|size|integer|null: false|
|brand_name|string|null: false|
|quality|integer|null: false|
|delivery_origin|string|null: false|
|delivery_status|integer|default: 0|
|user|references|null: false,foreign_key: true|


### Association
- belongs_to :user
- has_one :order
- has_many :comments, dependent: :destroy
- has_many :images, dependent: :destroy
- has_many :categories
- has_many :category_genres, through: :categories

## index
- add_index products, :name



## products_images table
|Column|Type|Options|
|------|----|-------|
|image_url|string|null: false|
|product|references|null: false,foreign_key: true|


### Association
- belongs_to :product




## category_genres table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :categories
- has_many :products, through: :categories




## categories table
|Column|Type|Options|
|------|----|-------|
|product|references|null: false,foreign_key: true|
|category_genre|references|null: false,foreign_key: true|

### Association
- belongs_to :products
- belongs_to :category




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
<img width="902" alt="ERforMercari" src="https://user-images.githubusercontent.com/49634472/62509731-40bfa100-b847-11e9-87e5-344adb5ec4a8.png">