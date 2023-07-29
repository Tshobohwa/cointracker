require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Categories', type: :request do
  include Devise::Test::IntegrationHelpers

  before do
    @user = User.create(name: 'Salomon', email: 'text@t.com', password: '123456')
    sign_in @user
  end

  describe 'GET /index' do
    before do
      get categories_path
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
      Category.create(name: 'food', icon: 'https://food.jpg')
      get '/categories/new/'
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'It returns the correct template' do
      expect(response).to render_template(:new)
    end
  end
end
