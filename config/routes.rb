# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users/new'

  root 'welcome#index'

  resources :settings
  resources :certificates

  resources :proposals
  resources :solution_proposals
  resources :protocols
  resources :conclusions
  resources :solutions
  resources :permissions
  resources :ikcontracts
  resources :certcontracts
  resources :inventories
  resources :attachments

  get       '/signup',  to: 'users#new'
  get       '/login',   to: 'sessions#new'
  post      '/login',   to: 'sessions#create'
  delete    '/logout',  to: 'sessions#destroy'
  resources :users

  get 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
