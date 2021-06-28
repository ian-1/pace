# frozen_string_literal: true

Rails.application.routes.draw do
  resources :meetups
  devise_for :users
  root "users#index"
  post "/users/:id", to: "users#show"
  post "/users/:id/edit", to: "users#edit"
  resources :users do
    resources :endorsements
    resources :reports
  end

  resources :conversations do
    resources :messages
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
