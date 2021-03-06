Rails.application.routes.draw do
  root 'static_pages#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :places do
        resources :reviews
      end
    end
  end

    resources :places, only: [:new, :create, :show] do
  end
end
