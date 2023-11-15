require 'rails_helper'
require_relative 'spec_support_helpers'

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

  it 'can see the recipe header' do
    user = authentificate_test_user
    visit user_recipe_path(user, @recipe)
    expect(page).to have_content('Recipes Details')
  end

  it 'can see the recipe name' do
    user = authentificate_test_user
    visit user_recipe_path(user, @recipe)
    expect(page).to have_content(@recipe.name)
  end

  it 'can see the recipe preparation time' do
    user = authentificate_test_user
    visit user_recipe_path(user, @recipe)
    expect(page).to have_content(@recipe.preparation_time)
  end

  it 'can see the recipe cooking time' do
    user = authentificate_test_user
    visit user_recipe_path(user, @recipe)
    expect(page).to have_content(@recipe.cooking_time)
  end

  it 'can see the recipe description' do
    user = authentificate_test_user
    visit user_recipe_path(user, @recipe)
    expect(page).to have_content(@recipe.description)
  end

  it 'can see recipe ingredient' do
    user = authentificate_test_user
    visit user_recipe_path(user, @recipe)
    expect(page).to have_content(@food.name)
  end

  it 'redirect to add ingredient page' do
    user = authentificate_test_user
    visit user_recipe_path(user, @recipe)
    click_link 'Add Ingredient'
    expect(has_current_path?(new_user_recipe_recipe_food_path(user, @recipe), wait: 2)).to be_truthy
  end
end
