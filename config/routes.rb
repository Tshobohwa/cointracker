Rails.application.routes.draw do
  get 'home', to: 'splash_screen#index', as: 'splash_screen'
  devise_for :users
  root to: "category#index"
  resources :category, only: [:index, :show, :new, :create] do
    resources :expenses, only: [:index, :show, :new, :create]
  end

end
