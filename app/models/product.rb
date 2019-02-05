class Product < ApplicationRecord
  # validates :name, presence: true, length: { in: 1..40 }
  # validates :description, presence: true, length: { in: 1..1000 }
  # validates :category, presence: true
  # validates :status, presence: true
  # validates :shipping_method, presence: true
  # validates :region, presence: true
  # validates :shipping_timetable, presence:true
  # validates :price, presence:true, length: { in: 300..9999999 }

  belongs_to :seller, class_name: 'User'
  belongs_to :buyer, class_name: 'User'
end
