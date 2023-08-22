class Product < ApplicationRecord
  belongs_to :user

  CATEGORIES = %w[lunch leisure work]
  validates :category, inclusion: { in: CATEGORIES }
  validates :name, :category, :price, :description, presence: true
end
