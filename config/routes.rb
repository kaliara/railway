Rails.application.routes.draw do
  passwordless_for :users

  resources :users, except: [:index, :destroy]
  resource :reservation, except: [:destroy]
  resolve('Reservation') { [:reservation] }

  patch '/reservation/preview', to: 'reservations#update_preview', as: :reservation_update_preview

  root "reservations#show"
end
