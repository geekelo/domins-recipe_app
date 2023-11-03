def index
  @recipe_foods = RecipeFood.joins(:food)
    .select('foods.name,
                                     SUM(recipe_foods.quantity) as total_quantity,
                                     SUM(recipe_foods.value) as total_value')
    .group('foods.name')
    .includes(:food)
end
