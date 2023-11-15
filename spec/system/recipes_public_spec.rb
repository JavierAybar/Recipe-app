require 'rails_helper'

RSpec.describe 'Recipes', type: :system do
  before do
    driven_by(:rack_test)
    @user = User.create(name: 'Soban', email: 'test@test.com', password: 123456, password_confirmation: 123456)
    @public_recipe = Recipe.create(user_id: @user, name: 'Boiled Egg', preparation_time: 0.25, cooking_time: 0.5, description: 'Egg boiled in hot water and peeled.', public: true)
    visit root_path
  end

  it 'Should render public header' do
    expect(page).to have_content('Public Recipes')
  end

  it 'Should render recipe name' do
    expect(page).to have_content('Sign In')
  end

  it 'Should click the link with the name of the recipe' do
    click_on('Sign In')
    expect(page).to have_current_path(new_user_session_path)
  end
end