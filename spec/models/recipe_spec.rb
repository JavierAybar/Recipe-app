require 'rails_helper'

RSpec.describe Recipe, type: :model do
  newuser123 = User.create(name: 'Obiba', email: 'test123@email.com', password: 654321, password_confirmation: 654321)
  subject { Recipe.new(user: newuser123, name: 'Pizza', preparation_time: 0.25, cooking_time: 0.5, description: 'Egg boiled in hot water and peeled.', public: true) }
  before { subject.save }

  it 'name should be present' do
    expect(subject).to be_valid
  end

end

