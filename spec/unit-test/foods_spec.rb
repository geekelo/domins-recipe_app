require 'rails_helper'

RSpec.describe Food, type: :model do
  it 'is valid with a valid price' do
    food = Food.new(price: 10.99) # Change the price to a valid value
    expect(food).to be_valid
  end

  it 'is not valid with a negative price' do
    food = Food.new(price: -5) # Negative price should not be valid
    expect(food).not_to be_valid
  end

  it 'is not valid without a price' do
    food = Food.new(price: nil) # Price should be present
    expect(food).not_to be_valid
  end

  # You can add more tests for other validations or associations here
end
