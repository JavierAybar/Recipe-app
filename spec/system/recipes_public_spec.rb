require 'rails_helper'

RSpec.describe 'Recipes', type: :system do
  before do
    driven_by(:rack_test)
    @user = User.create(name: 'Albert Testy')
    @public_recipe = Recipe.create(user: @user, name: 'Boiled Egg', preparation_time: 0.25, cooking_time: 0.5, description: 'Egg boiled in hot water and peeled.', public: true)
    visit root_path
  end

  it 'Should render public header' do
    expect(page).to have_content('Public Recipes')
  end

  it 'Should render recipe name' do
    expect(page).to have_content('Boiled Egg')
  end

  it 'Should render recipe owner name' do
    expect(page).to have_content('By Albert Testy')
  end

  it 'Should render total number of food items' do
    expect(page).to have_content('Total food items: 0')
  end

  it 'Should render total price' do
    expect(page).to have_content('Total price: $ 0')
  end

  it 'Should click the link with the name of the recipe' do
    click_on('Boiled egg')
    expect(page).to have_current_path(user_recipe_path(@user, @public_recipe))
  end
end