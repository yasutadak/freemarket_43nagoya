# DB design

## users
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_k|string|null: false|
|first_name_k|string|null: false|
|postal_code|integer| |
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building|string| |
|birthday|date|null: false|
|phone_number|integer|null: false|
|profile|text| |
|nickname|string|null: false|

### Association
- has_many :selling_product, -> { where('buyer_id is NULL') }, foreign_key: 'seller_id', class_name: 'Product'
- has_many :sold_product, -> { where('buyer_id is not NULL') }, foreign_key: 'seller_id', class_name: 'Product'
- has_many :buyed_product, foreign_key: 'buyer_id', class_name: 'Product'

## products
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|product|string|null: false, index:true|
|state|string|null: false|
|postage|string|null: false|
|shipping_method|string|null: false|
|region|string|null: false|
|criterion|string|null: false|
|description|text|null: false|
|price|integer|null: false|
|seller|references|null: false, foreign_key: true|
|buyer|references|null: false, foreign_key: true|

### Association
- belongs_to :seller, class_name: 'User', counter_cache: true
- belongs_to :buyer, class_name: 'User'
