class FoodsController < ApplicationController
  before_action :authenticate_user!

  def index
    @foods = current_user.foods
  end

  def new
    @food = current_user.foods.build
  end

  def create
    @food = current_user.foods.build(food_params)
    if @food.save
      redirect_to foods_path, notice: 'Food item successfully added'
    else
      render :new
    end
  end

  def show
    destroy
  end

  def destroy
    @food = current_user.foods.find(params[:id])
    RecipeFood.where(food_id: @food.id).destroy_all
    @food.destroy
    redirect_to foods_path, notice: 'Food item successfully deleted'
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :quantity, :price)
  end
end
