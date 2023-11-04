# spec/features/food_list_spec.rb

require 'rails_helper'

RSpec.describe "Food List", type: :feature do
  before do
    # You can set up any necessary data here, e.g., creating food records
  end

  it "displays a list of food items" do
    food1 = Food.create(name: "Apple", quantity: 5, measurement_unit: "pieces", price: 1.0)
    food2 = Food.create(name: "Banana", quantity: 10, measurement_unit: "pieces", price: 0.5)

    visit foods_path

    expect(page).to have_content("Your Food List")
    expect(page).to have_content("#{food1.name} - #{food1.quantity} #{food1.measurement_unit} - $#{food1.price}")
    expect(page).to have_content("#{food2.name} - #{food2.quantity} #{food2.measurement_unit} - $#{food2.price}")
  end

  it "deletes a food item" do
    food = Food.create(name: "Orange", quantity: 3, measurement_unit: "pieces", price: 0.75)

    visit foods_path

    expect(page).to have_content("#{food.name} - #{food.quantity} #{food.measurement_unit} - $#{food.price}")
    accept_confirm do
      click_link "Delete", match: :first
    end
    expect(page).not_to have_content("#{food.name} - #{food.quantity} #{food.measurement_unit} - $#{food.price}")
  end

  it "navigates to the 'Add New Food' page" do
    visit foods_path
    click_link "Add New Food"
    expect(page).to have_content("New Food")
  end
end
