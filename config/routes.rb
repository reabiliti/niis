Rails.application.routes.draw do

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

  get 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
