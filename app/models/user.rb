class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :selling_products, -> { where('buyer_id is NULL') }, foreign_key: 'seller_id', class_name: 'Product'
  has_many :sold_products, -> { where('buyer_id is not NULL') }, foreign_key: 'buyer_id', class_name: 'Product'
  has_many :bought_products, foreign_key: 'buyer_id', class_name: 'Product'
end
