## user table

|Column|Type|Options|
|------|----|-------|
|name|integer|null: false|
|email|integer|null: false|
|tel|integer|null: false|
|street_adress|string|null: false, foreign_key: true|
|credit_number|integer|null: false, foreign_key: true|
|birthday|integer|null: false|

### Association
- belongs_to :street_adress
- belongs_to :credit
- has_many :products
- has_many :comments



## street_adress table

|Column|Type|Options|
|------|----|-------|
|prefecture|string|null: false|
|city|string|null: false|
|adress|integer|null: false|
|building|string|null: false|

### Association
- belongs_to :user


## credit table

|Column|Type|Options|
|------|----|-------|
|number|integer|null: false, unique: true|
|expiration_date|integer|null: false|
|security_code|integer|null: false, unique: true|

### Association
- belongs_to :user


## product table

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|quality|string|null: false|
|shipping_origin|string|null: false|
|listing_status|string|null: false|
|description|text|null: false|
|image|text|null: false|
|user_id|references: user|foreign_key: true|
|category_id|references: category|foreign_key: true|

### Association
- belongs_to :user
- has_many :categorys, through: :items


## category table

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
- belongs_to :product
- belongs_to :category



## comment table
|Column|Type|Options|
|------|----|-------|
|user_id|references: user|foreign_key: true|
|product_id|references: product|foreign_key: true|
|text|text|null: false|

### Association
- belongs_to :user
