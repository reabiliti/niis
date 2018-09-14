# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'
  resources :settings, except: %i[index destroy]
  resources :certificates, except: :index
  resources :proposals, except: :index
  resources :solution_proposals, except: :index
  resources :protocols, except: :index
  resources :conclusions, except: :index
  resources :solutions, except: :index
  resources :permissions, except: :index
  resources :ikcontracts, except: :index
  resources :certcontracts, except: :index
  resources :inventories, except: :index
  resources :attachments, except: :index
  resources :users, only: %i[new create]
  resources :sessions, only: %i[new create destroy]

  get       '/signup',  to: 'users#new'
  get       '/login',   to: 'sessions#new'
  post      '/login',   to: 'sessions#create'
  delete    '/logout',  to: 'sessions#destroy'
end
