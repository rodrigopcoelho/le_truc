class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :slots
  self.per_page = 12

  CATEGORIES = %w[lunch leisure work]
  validates :category, inclusion: { in: CATEGORIES }
  validates :name, :category, :price, :description, presence: true
end
