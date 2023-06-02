Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :vans do
    resources :reservations, except: [:destroy, :index]
  end
  resources :reservations, only: [:destroy, :index, :update, :show]

  get '/my_owner_reservations', to: 'reservations#my_owner_reservations'
end
