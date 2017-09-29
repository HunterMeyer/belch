Rails.application.routes.draw do
  root 'trainers#new'
  resources :trainers, only: [:new, :create, :show] do
    get :find, on: :collection
    member do
      get :beers,   defaults: { format: :json }
      post :rating, defaults: { format: :json }
    end
  end
end
