class RecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    @recipes = current_user.recipes
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: 'Recipe updated successfully.'
    else
      render :edit
    end
  end

  def new
    @recipe = current_user.recipes.build
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      redirect_to recipes_path, notice: 'Recipe item added successfully.'
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @user = @recipe.user
    @foods = @recipe.foods
  end

  def edit
    @recipe = current_user.recipes.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path, notice: 'Recipe item deleted successfully'
  end

  def destroy
    @recipe = current_user.recipes.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path, notice: 'Recipe item deleted successfully'
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :cooking_time, :preparation_time, :public)
  end
end
