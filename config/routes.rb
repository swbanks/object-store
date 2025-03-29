Rails.application.routes.draw do
  root to: 'site#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :users
    resources :storage, only: [:create, :index, :show, :destroy] do
      collection do
        get 'search'
      end
    end
  end
end
