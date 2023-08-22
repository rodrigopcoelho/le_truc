class Product < ApplicationRecord
  belongs_to :user
  has_one_photo:

  CATEGORIES = %w[lunch leisure work]
  validates :category, inclusion: { in: CATEGORIES }
  validates :name, :category, :price, :description, presence: true
end
