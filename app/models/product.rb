class Product < ApplicationRecord
  belongs_to :seller, class_name: 'User'
  belongs_to :buyer, class_name: 'User', optional: true

  def prev
    Product.where("id < ?", self.id).order("id DESC").first
  end

  def next
    Product.where("id > ?", self.id).order("id ASC").first
  end
end
