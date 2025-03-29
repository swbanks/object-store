Rails.application.routes.draw do
  root to: 'site#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :users
  end
end
