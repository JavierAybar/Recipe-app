require 'rails_helper'

RSpec.describe Recipe, type: :model do
  @user = User.create(name: 'javier', email: 'test2@test2.com', password: 123456, password_confirmation: 123456)
  subject { Recipe.new(user_id: @user, name: 'Boiled Eggs', preparation_time: 0.25, cooking_time: 0.5, description: 'Egg boiled in hot water and peeled.', public: true) }
  before { subject.save }

  it 'name should be present' do
    expect(subject).to be_valid
  end

end