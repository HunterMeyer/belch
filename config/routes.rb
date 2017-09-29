Rails.application.routes.draw do
  resources :trainers, only: [:new, :create, :show] do
    member do
      get :beers,   defaults: { format: :json }
      post :rating, defaults: { format: :json }
    end
  end
end
