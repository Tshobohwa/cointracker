require 'rails_helper'

RSpec.describe Group, type: :model do
  before :each do
    @user = User.create(name: 'Salomon', email: 'test@g.com', password: '123456')
  end
  it 'is valid with valid attributes' do
    expense = Group.new(name: 'food expenses', icon: 'https://group-icon.png', user_id: @user.id)
    expect(expense).to be_valid
  end
  it 'is not valid without a name' do
    expense = Group.new(icon: 'https://group-icon.png', user_id: @user.id)
    expect(expense).not_to be_valid
  end
  it 'is not valid without an icon' do
    expense = Group.new(name: 'food expenses', user_id: @user.id)
    expect(expense).not_to be_valid
  end
end
