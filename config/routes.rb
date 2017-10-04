Rails.application.routes.draw do
  root 'trainers#new'

  resources :trainers, only: [:new, :create, :show] do
    scope module: :trainers do
      resources :beers, only: [:index] do
        post :rate, defaults: { format: :json }
      end
    end
  end
end
