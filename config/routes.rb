Rails.application.routes.draw do
  resources :pubs
  resources :users
  root 'users#welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
