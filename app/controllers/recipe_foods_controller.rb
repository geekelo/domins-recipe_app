class RecipeFoodsController < ApplicationController
  before_action :set_recipe

  def new
    @recipe_food = @recipe.recipe_foods.new
  end

  def create
    @recipe_food = @recipe.recipe_foods.find_or_initialize_by(food_id: recipe_food_params[:food_id])
    @recipe_food.quantity = recipe_food_params[:quantity] # Set quantity
    @recipe_food.calculate_value
    if @recipe_food.save
      redirect_to @recipe, notice: 'Food added successfully.'
    else
      render :new
    end
  end

  def update
    @recipe_food = @recipe.recipe_foods.find(params[:id])
    @recipe_food.assign_attributes(recipe_food_params)

    @recipe_food.calculate_value
    if @recipe_food.save
      redirect_to @recipe, notice: 'Food updated successfully.'
    else
      render :edit
    end
  end

  def edit
    @recipe_food = @recipe.recipe_foods.find(params[:id])
  end

  def destroy
    @recipe_food = @recipe.recipe_foods.find(params[:id])
    @recipe_food.destroy
    redirect_to @recipe, notice: 'Food removed successfully.'
  end

  private

  def set_recipe
    @recipe = Recipe.includes(:recipe_foods, :foods).find(params[:recipe_id])
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:food_id, :quantity, :value)
  end
end
