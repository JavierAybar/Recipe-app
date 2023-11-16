require 'rails_helper'

RSpec.describe 'RecipesController', type: :request do
  describe 'GET /index' do
    before do
      user = User.create(name: 'Soban', email: 'test@tests.com', password: 123_456, password_confirmation: 123_456)

      get user_recipes_path(user)
    end

    context 'renders the index template' do
      it 'response status is correct' do
        expect(response).to have_http_status(200)
      end

      it 'correct template is rendered' do
        expect(response).to render_template(:index)
      end

      it 'the response body includes correct placeholder text' do
        expect(response.body).to include('My Recipes')
      end
    end
  end
end