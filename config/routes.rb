Rails.application.routes.draw do
  passwordless_for :users

  resources :users, except: [:index, :destroy]
  resource :reservation, except: [:destroy]

  resolve('Reservation') { [:reservation] }
  get '/reservation/edit/optional', to: 'reservations#edit', defaults: { optional: true }, as: :optional_survey
  get '/reservation/activities/:old/:changed', to: 'reservations#update_activity_preference', as: :update_reservation_activity_preference
  patch '/reservation/preview', to: 'reservations#update_preview', as: :reservation_update_preview
  patch '/reservation/optional/preview', to: 'reservations#update_optional_preview', as: :reservation_update_optional_preview
  patch '/reservation/optional', to: 'reservations#update'
  patch '/reservation/full/preview', to: 'reservations#update_full_preview', as: :reservation_update_full_preview
  patch '/reservation/full', to: 'reservations#update'

  get '/instant_login/:token', to: 'sessions#create', as: :instant_login
  get '/users/:id/view_invite', to: 'users#view_invite', as: :view_invite, defaults: { format: '.hit' }
  get '/map', to: 'home#map', as: :map

  root "home#index"
end
