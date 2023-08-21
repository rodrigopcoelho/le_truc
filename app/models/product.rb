class Product < ApplicationRecord
  CATEGORIES = ["lunch", "work", "leisure"]
  belongs_to :user
  validates :name, :description, :price, :category, presence: true
end
