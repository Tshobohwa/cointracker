require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Expenses', type: :request do
  include Devise::Test::IntegrationHelpers

  before do
    @user = User.create(name: 'Salomon', email: 'test@gmail.com', password: '123456')
    sign_in @user
    @category = Category.create(name: 'macdonald', icon: 'https://icon.png', user_id: @user.id)
  end

  describe 'GET /index' do
    before do
      get category_expenses_path(@category.id)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'It returns the correct template' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /create' do
    before do
      Expense.create(name: 'food', amount: 400)
      get new_category_expense_path(@category.id)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'It returns the correct template' do
      expect(response).to render_template(:new)
    end
  end
end
