Rails.application.routes.draw do
  passwordless_for :users

  resources :users, except: [:index, :destroy]
  resource :reservation, except: [:destroy]
  resolve('Reservation') { [:reservation] }
  get '/reservation/edit/optional', to: 'reservations#edit', defaults: { optional: true }, as: :optional_survey

  patch '/reservation/preview', to: 'reservations#update_preview', as: :reservation_update_preview
  get '/instant_login/:token', to: 'sessions#create', as: :instant_login
  get '/map', to: 'home#map', as: :map

  root "home#index"
end
