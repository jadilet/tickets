Rails.application.routes.draw do
  get 'payments/info/:id', to: 'payments#info', as: 'payment', :constraints => { :id => /[0-9]+(\%7C[0-9]+)*/ }
  get 'events/index'
  get 'events/show/:id', to: 'events#show', as: 'event', :constraints => { :id => /[0-9]+(\%7C[0-9]+)*/ }
  devise_for :users, :controllers => {registrations: 'registrations'}
  post 'reservations/reserve', to: 'reservations#reserve'
  post 'payments/pay', to: 'payments#pay'
  root 'events#index'

  require 'sidekiq/web'
  require 'sidekiq/cron/web'
  mount Sidekiq::Web => '/sidekiq'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
