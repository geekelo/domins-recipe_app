class GeneralShoppingListsController < ApplicationController
  def index
    @recipe_foods = Food.joins(
      "INNER JOIN (SELECT food_id,
                        SUM(quantity) as total_quantity,
                        SUM(value) as total_value
                 FROM recipe_foods GROUP BY food_id) as subquery
       ON foods.id = subquery.food_id"
    )
      .select('foods.name,
               subquery.total_quantity,
               subquery.total_value')
  end
end
