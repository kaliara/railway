Rails.application.routes.draw do
  passwordless_for :users

  resources :users, except: [:index, :destroy]
  resource :reservation, except: [:destroy]
  resolve('Reservation') { [:reservation] }

  root "reservations#new"
end
