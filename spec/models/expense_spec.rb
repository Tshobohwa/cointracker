require 'rails_helper'

RSpec.describe Expense, type: :model do
  before :each do
    @user = User.create(name: 'Salomon', email: 'test@g.com', password: '123456')
  end
  it 'is valid with valid attributes' do
    expense = Expense.new(name: 'food', amount: 30, author_id: @user.id)
    expect(expense).to be_valid
  end
  it 'is not valid without a name' do
    expense = Expense.new(amount: 30, author_id: @user.id)
    expect(expense).not_to be_valid
  end
  it 'is not valid without an amount' do
    expense = Expense.new(name: 'food', author_id: @user.id)
    expect(expense).not_to be_valid
  end
  it 'is not valid without a negative amount' do
    expense = Expense.new(name: 'food', amount: -30, author_id: @user.id)
    expect(expense).not_to be_valid
  end
end
