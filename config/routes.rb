# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins

  resources :admin, only: %i[index]

  namespace :admin do
    resources :products do
      resources :stocks
    end
    resources :categories
    resources :orders
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ('/')
  root to: 'home#index'

  authenticated :admin_user do
    root to: 'admin#index', as: :admin_root
  end

  resources :categories, only: %i[index show]
  resources :products, only: %i[index show]

  post 'checkout' => 'checkouts#create'
  get 'cart' => 'carts#show'

  # Route to handle external reference in chart.js
  get '/_/:filename', to: 'assets#serve_js', constraints: { filename: /.*\.js/ }

  # Stripe routes
  get 'stripe_payment_success' => 'checkouts#success'
  get 'stripe_payment_cancel' => 'checkouts#cancel'
  post 'stripe_webhooks' => 'webhooks#stripe'
end
