require 'rails_helper'

RSpec.describe 'FoodsController', type: :request do

  describe 'GET /index' do
    before do
      user = User.create(name: 'Soban', email: 'test@tests.com', password: 123_456, password_confirmation: 123_456)
      get user_foods_path(user)
    end

    it 'returns a successful response' do
      expect(response).to have_http_status(200)
    end

    it 'correct template is rendered' do
      expect(response).to render_template(:index)
    end

    it 'the response body includes correct placeholder text' do
      expect(response.body).to include('List of Foods')
    end
  end
end