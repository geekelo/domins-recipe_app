# spec/models/recipe_spec.rb

require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      user = User.create(name: 'Test User')
      recipe = Recipe.new(user:, name: 'Test Recipe')
      expect(recipe).to be_valid
    end

    it 'is not valid without a user' do
      recipe = Recipe.new(name: 'Test Recipe')
      expect(recipe).not_to be_valid
    end
  end

  describe 'defaults' do
    it 'sets public to false by default' do
      user = User.create(name: 'Test User')
      recipe = Recipe.new(user:, name: 'Test Recipe')
      expect(recipe.public).to eq(false)
    end
  end

  describe 'associations' do
    it 'has many recipe_foods' do
      should have_many(:recipe_foods)
    end

    it 'has many foods through recipe_foods' do
      should have_many(:foods).through(:recipe_foods)
    end
  end
end
