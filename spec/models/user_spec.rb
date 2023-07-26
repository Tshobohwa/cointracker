require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(name: 'john_doe', email: 'john@example.com', password: 'john1234')
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user = User.new(email: 'john@example.com', password: 'john1234')
    expect(user).not_to be_valid
  end
  it 'is not valid without a password' do
    user = User.new(name: 'john_doe', email: 'john@example.com')
    expect(user).not_to be_valid
  end
  it 'is not valid without a email' do
    user = User.new(name: 'john_doe', password: 'john1234')
    expect(user).not_to be_valid
  end
end
