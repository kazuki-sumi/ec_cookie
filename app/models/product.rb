class Product < ApplicationRecord
  has_many :product_categories
  has_many :cart_items
  has_many :carts, through: :cart_items

  validates :name, presence: true, length: { maximum: 191 }
  validates :product_description, presence: true, length: { maximum: 65535 }
  validates :price, presence: true, numbericality: { only_integer: true }
  validates :size, presence: true
  validates :product_number, presence: true, numbericality: { only_integer: true }
end
