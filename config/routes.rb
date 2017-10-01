Rails.application.routes.draw do
  root 'trainers#new'
  resources :trainers, only: [:new, :create, :show] do
    get :find, on: :collection
    member do
      get  :unrated_beers, defaults: { format: :json }
      post :rate_beer,     defaults: { format: :json }
    end
  end
end
