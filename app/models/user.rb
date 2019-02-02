class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :selling_product, -> { where('buyer_id is NULL') }, foreign_key: 'seller_id', class_name: 'Product'
  has_many :sold_product, -> { where('buyer_id is not NULL') }, foreign_key: 'buyer_id', class_name: 'Product'
  has_many :bought_product, foreign_key: 'buyer_id', class_name: 'Product'
end
