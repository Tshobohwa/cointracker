Rails.application.routes.draw do
  get 'home', to: 'splash_screen#index', as: 'splash_screen'
  devise_for :users
  root to: "categories#index"
  resources :categories, only: [:index, :new, :create] do
    resources :expenses, only: [:index, :show, :new, :create]
  end

end
