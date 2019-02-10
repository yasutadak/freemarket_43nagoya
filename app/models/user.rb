class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :selling_products, -> { where('buyer_id is NULL') }, foreign_key: 'seller_id', class_name: 'Product'
  has_many :sold_products, -> { where('buyer_id is not NULL') }, foreign_key: 'buyer_id', class_name: 'Product'
  has_many :bought_products, foreign_key: 'buyer_id', class_name: 'Product'

  with_options on: [:registration_step_1] do
    validates :nickname,  presence: true,  length: { maximum: 20 }
  end

  with_options on: [:registration_step_2] do
    validates :phone_number,  presence: true
  end

  with_options on: [:registration_step_3] do
    validates :family_name,  presence: true
    validates :first_name,  presence: true
    validates :family_katakana,  presence: true, format: { with: /[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/, allow_blank: true}
    validates :first_katakana,  presence: true, format: { with: /[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/, allow_blank: true}
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, allow_blank: true}
    validates :domicile_pref,  presence: true
    validates :domicile_city,  presence: true
    validates :domicile_add,  presence: true
  end

  protected
  def password_required?
    if validation_context == :registration_step_1
      !persisted? || !password.nil? || !password_confirmation.nil?
    end
  end

  def email_required?
    if validation_context == :registration_step_1
      true
    end
  end
end
