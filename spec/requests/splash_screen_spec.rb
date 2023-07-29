require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'SplashScreens', type: :request do
  include Devise::Test::IntegrationHelpers

  before do
    @user = User.create(name: 'Salomon', email: 'text@gmail.com', password: '123456')
    sign_in @user
  end

  describe 'GET /index' do
    it 'returns http success' do
      get '/home'
      expect(response).to have_http_status(:success)
    end
  end
end
