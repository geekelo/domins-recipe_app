class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
  has_many :foods, through: :recipe_foods

  private

  def set_defaults
    self.public ||= false
  end
end
