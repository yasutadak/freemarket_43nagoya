class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  with_options presence: { message: "選択してください" } do
   validates :status
   validates :shipping_method
   validates :shipping_burden
   validates :shipping_timetable
   validates :region
   validates :image
 end

  validates :name, presence: { message: "入力してください" }, length: { in: 1..40, message: "40 文字以下で入力してください"}
  validates :description, presence: { message: "入力してください" }, length: { in: 1..1000, message: "1000 文字以下で入力してください" }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "300以上9999999以下で入力してください"}

  belongs_to :seller, class_name: 'User'
  belongs_to :buyer, class_name: 'User', optional: true

  def prev_id
    Product.where("id < ?", self.id).order("id DESC").first
  end

  def next_id
    Product.where("id > ?", self.id).order("id ASC").first
  end

  scope :sort_new_id, -> { order("id DESC") }

  enum status: [
    "new_item",
    "close_new",
    "no_dirt",
    "little_dirt",
    "dirt",
    "bad_item"]

  enum shipping_burden: [
    "exhibitor_burden",
    "purchaser_burden"]

  enum shipping_method: [
    "undecided",
    "merukari",
    "yu_mail",
    "letter_pack",
    "regular_mail",
    "kuroneko",
    "yu_pack",
    "click_post",
    "yu_packet"]

  enum shipping_timetable: [
    "first_days",
    "second_days",
    "third_days"]

end
