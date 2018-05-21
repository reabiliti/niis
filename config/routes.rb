# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users/new'

  root 'welcome#index'

  resources :settings, except: %i[index destroy]
  resources :certificates, except: [:index]

  resources :proposals, except: [:index]
  resources :solution_proposals, except: [:index]
  resources :protocols, except: [:index]
  resources :conclusions, except: [:index]
  resources :solutions, except: [:index]
  resources :permissions, except: [:index]
  resources :ikcontracts, except: [:index]
  resources :certcontracts, except: [:index]
  resources :inventories, except: [:index]
  resources :attachments, except: [:index]

  get       '/signup',  to: 'users#new'
  get       '/login',   to: 'sessions#new'
  post      '/login',   to: 'sessions#create'
  delete    '/logout',  to: 'sessions#destroy'
  resources :users

  get 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
