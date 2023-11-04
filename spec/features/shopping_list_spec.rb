# spec/features/shopping_list_spec.rb

require 'rails_helper'

RSpec.describe 'General Shopping List', type: :feature do
  before do
    # You can set up any necessary data here, e.g., creating recipe_foods
  end

  it 'displays a table of food items' do
    recipe_food1 = RecipeFood.create(name: 'Apple', total_quantity: 10, total_value: 5.0)
    recipe_food2 = RecipeFood.create(name: 'Banana', total_quantity: 20, total_value: 10.0)

    visit shopping_list_path

    expect(page).to have_content('General Shopping List')
    expect(page).to have_selector('table tr th', text: 'Food')
    expect(page).to have_selector('table tr th', text: 'Total Quantity')
    expect(page).to have_selector('table tr th', text: 'Total Value')

    expect(page).to have_selector('table tr td', text: recipe_food1.name)
    expect(page).to have_selector('table tr td', text: recipe_food2.name)
    expect(page).to have_selector('table tr td', text: recipe_food1.total_quantity.to_s)
    expect(page).to have_selector('table tr td', text: recipe_food2.total_quantity.to_s)
    expect(page).to have_selector('table tr td', text: "$#{recipe_food1.total_value}")
    expect(page).to have_selector('table tr td', text: "$#{recipe_food2.total_value}")
  end

  it 'displays the total number of foods to buy and total value' do
    RecipeFood.create(name: 'Apple', total_quantity: 10, total_value: 5.0)
    RecipeFood.create(name: 'Banana', total_quantity: 20, total_value: 10.0)

    visit shopping_list_path

    expect(page).to have_content('Total Foods to Buy: 2')
    expect(page).to have_content('Total Value: $15')
  end
end
