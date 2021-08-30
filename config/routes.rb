Rails.application.routes.draw do
  devise_for :users
  root to: "totonous#index"
  resources :totonous, only: [:index, :new] do
  end
  resources :users, only: :show
end

