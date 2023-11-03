class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  def calculate_value
    self.value = quantity * food.price.to_f
  end
end
