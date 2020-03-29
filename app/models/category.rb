class Category < ApplicationRecord
  has_many :product_categories
  validates :name, presence: true, length: { maximum: 191 }
  validates :category_summary, length: { maximum: 65535 }
end
