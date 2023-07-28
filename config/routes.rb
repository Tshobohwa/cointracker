Rails.application.routes.draw do
  get 'home', to: 'splash_screen#index', as: 'splash_screen'
  devise_for :users
  root to: "cathegory#index"
  resources :cathegory, only: [:index, :show, :new] do
    resources :expenses, only: [:index, :show, :new]
  end

end
