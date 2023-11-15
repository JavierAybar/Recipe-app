require 'rails_helper'
require_relative './spec_support_helpers'

RSpec.describe Recipe, type: :system do
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

  it 'can see the recipes header' do
    user = authentificate_test_user
    visit user_recipes_path(user)
    expect(page).to have_content(@recipe.name)
  end

  it 'can see the recipe name' do
    user = authentificate_test_user
    visit user_recipes_path(user)
    expect(page).to have_content('My Recipes')
  end

  it 'can see recipe description' do
    user = authentificate_test_user
    visit user_recipes_path(user)
    expect(page).to have_content(@recipe.description)
  end
  
  it 'redirect to recipe details page' do
    user = authentificate_test_user
    visit user_recipes_path(user)
    click_on @recipe.name
    expect(has_current_path?(user_recipe_path(user, @recipe), wait: 2)).to be_truthy
  end
end