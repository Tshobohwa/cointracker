Rails.application.routes.draw do
  devise_for :users
  root to: "group#index"
  resources :group, only: [:index, :show, :new] do
    resources :expenses, only: [:index, :show, :new]
  end

end
