require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'TestBot') }
  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to be_valid
  end
end