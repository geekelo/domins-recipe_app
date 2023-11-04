# spec/models/recipe_food_spec.rb

require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  describe '#calculate_value' do
    it 'calculates the value correctly' do
      food = Food.create(price: 5.0)
      recipe_food = RecipeFood.new(quantity: 2, food:)

      recipe_food.calculate_value

      expect(recipe_food.value).to eq(10.0)
    end
  end
end
