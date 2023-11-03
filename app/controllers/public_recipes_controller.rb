class PublicRecipesController < ApplicationController
  def index
    @public_recipes = Recipe.where(public: true).includes(:recipe_foods => :food)
  end

  def show
    @recipe = Recipe.find(params[:id])
    @user = @recipe.user
    @foods = @recipe.foods
  end
end
