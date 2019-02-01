# DB design

## User
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_katakana|string|null: false|
|first_katakana|string|null: false|
|postal_code|string| |
|domicile_pref|string|null: false|
|domicile_city|string|null: false|
|domicile_add|string|null: false|
|building|string| |
|birthday|date|null: false|
|phone_number|string|null: false|
|profile|text| |
|nickname|string|null: false|
|icon|string| |

### Association
- has_many :selling_product, -> { where('buyer_id is NULL') }, foreign_key: 'seller_id', class_name: 'Product'
- has_many :sold_product, -> { where('buyer_id is not NULL') }, foreign_key: 'buyer_id', class_name: 'Product'
- has_many :buyed_product, foreign_key: 'buyer_id', class_name: 'Product'
- has_many :likes, dependent: :destroy
- has_many :comments
- has_many :evaluates
- has_many :points

## Product
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index:true|
|status|integer|null: false|
|shipping_method|integer|null: false|
|region|string|null: false|
|shipping_timetable|integer|null: false|
|description|text|null: false|
|price|integer|null: false|
|seller|references|null: false, foreign_key: { to_table: :users }|
|buyer|references|null: false, foreign_key: { to_table: :users }|
|category|references|null: false, foreign_key: true|
|brand|references|null: false, foreign_key: true|

### Association
- belongs_to :seller, class_name: 'User'
- belongs_to :buyer, class_name: 'User'
- has_many :images
- has_many :likes, dependent: :destroy
- has_many :comments
- belongs_to :category
- belongs_to :brand

## Image
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|product|references|null: false, foreign_key: true|

### Asociation
- belongs_to :product

## Like
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|product|references|null: false, foreign_key: true|

### Asociation
- belongs_to :user
- belongs_to :product

## Comment
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user|references|null: false, foreign_key: true|
|product|references|null: false, foreign_key: true|

### Asociation
- belongs_to :user
- belongs_to :product

## Evaluate
|Column|Type|Options|
|------|----|-------|
|result|integer|null: false|
|user|references|null: false, foreign_key: true|

### Asociation
- belongs_to :user

## Point
|Column|Type|Options|
|------|----|-------|
|point|integer|null: false|
|expiration_date|date| |
|user|references|null: false, foreign_key: true|

### Asociation
- belongs_to :user

## Category
|Column|Type|Options|
|------|----|-------|
|category|string|null: false, unique: true|

### Asociation
- has_many :products

## Brand
|Column|Type|Options|
|------|----|-------|
|brand|string|null: false, unique: true|

### Asociation
- has_many :products
