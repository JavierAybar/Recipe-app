require 'rails_helper'
require_relative './spec_support_helpers'

RSpec.describe Food, type: :system do
  before(:all) do
    user = authentificate_test_user
    @recipe = Recipe.first
    @recipe ||= Recipe.create(name: 'Pizza Recipe', description: 'Salt',
                              preparation_time: 10, cooking_time: 3, public: true, user:)
    @food = Food.first
    @food ||= Food.create(name: 'Salt', measurement_unit: 'gram', price: 1, quantity: 3, user:)
    @ingredient = RecipeFood.first
    @ingredient ||= RecipeFood.create(recipe: @recipe, food: @food, quantity: 1)
  end

  it 'can see the foods header' do
    user = authentificate_test_user
    visit user_foods_path(user)
    expect(page).to have_content('List of Foods')
  end

  it 'can see the food name' do
    user = authentificate_test_user
    visit user_foods_path(user)
    expect(page).to have_content(@food.name)
  end

  it 'can see the food measurement units' do
    user = authentificate_test_user
    visit user_foods_path(user)
    expect(page).to have_content(@food.measurement_unit)
  end

  it 'can see the food price' do
    user = authentificate_test_user
    visit user_foods_path(user)
    expect(page).to have_content(@food.price)
  end
  
  it 'redirect to add ingredient page' do
    user = authentificate_test_user
    visit user_foods_path(user)
    click_on 'Add Food'
    expect(has_current_path?(new_user_food_path(user), wait: 2)).to be_truthy
  end
end