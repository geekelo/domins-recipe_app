class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
  has_many :recipes, through: :recipe_foods

  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
