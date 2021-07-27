Rails.application.routes.draw do
  get 'totonous/index'
  devise_for :users
  root to: "totonous#index"
  resources :totonous, only: [:index, :new] do
  end
end
