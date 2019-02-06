class Product < ApplicationRecord
  validates :status, :shipping_method, :shipping_timetable, :region, presence: true
  validates :name, presence: true, length: { in: 1..40 }
  validates :description, presence: true, length: { in: 1..1000 }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  belongs_to :seller, class_name: 'User'
  belongs_to :buyer, class_name: 'User', optional: true
end
