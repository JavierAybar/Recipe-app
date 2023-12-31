require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Soban', email: 'test@tests.com', password: 123_456, password_confirmation: 123_456) }
  before { subject.save }

  it 'name should be present' do
    subject.name = 'test'
    expect(subject).to be_valid
  end
end
