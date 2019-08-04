## users table

|Column|Type|Options|
|------|----|-------|
|name|integer|null: false|
|email|integer|null: false|
|tel|integer|null: false|
|street_adress|string|null: false, foreign_key: true|
|credit_number|integer|null: false, foreign_key: true|
|birthday|integer|null: false|

### Association
- has_many :orders
- has_many :products
- has_many :comments
- has_one :profile, dependent: :destroy
- has_one :address, dependent: :destroy
- has_many :credit_cards, dependent: :destroy




## profiles table
|Column|Type|Options|
|------|----|-------|

### Association
- belongs_to :user




## street_adress table

|Column|Type|Options|
|------|----|-------|
|prefecture|string|null: false|
|city|string|null: false|
|adress|integer|null: false|
|building|string|null: false|

### Association
- belongs_to :user




## credit_cards table

|Column|Type|Options|
|------|----|-------|
|number|integer|null: false, unique: true|
|expiration_date|integer|null: false|
|security_code|integer|null: false, unique: true|

### Association
- belongs_to :user




##orders
|Column|Type|Options|
|------|----|-------|
### Association
- belongs_to :user
- belongs_to :products



## products table

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|quality|string|null: false|
|shipping_origin|string|null: false|
|listing_status|string|null: false|
|description|text|null: false|
|user_id|references: user|foreign_key: true|
|category_id|references: category|foreign_key: true|

### Association
- belongs_to :user
- has_one :order
- has_many :comments, dependent: :destroy
- has_many :images, dependent: :destroy
- has_many :categories, through: :items




## products_images table
|Column|Type|Options|
|------|----|-------|
### Association
- belongs_to :products



## categories table

|Column|Type|Options|
|------|----|-------|
|lady|references: product|foreign_key: true|
|man|references: product|foreign_key: true|
|kids|references: product|foreign_key: true|
|daily|references: product|foreign_key: true|
|enterme|references: product|foreign_key: true|
|other|references: product|foreign_key: true|

### Association
- has_many :products, through: :items




## items table
|Column|Type|Options|
|------|----|-------|
|product_id|references: product|foreign_key: true|
|category_id|references: category|foreign_key: true|

### Association
- belongs_to :products
- belongs_to :category




## comments table
|Column|Type|Options|
|------|----|-------|
|user_id|references: user|foreign_key: true|
|product_id|references: product|foreign_key: true|
|text|text|null: false|

### Association
- belongs_to :user
- belongs_to :product