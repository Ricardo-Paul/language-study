Rails.application.routes.draw do
  get 'answers/new'
  devise_for :users

  resources :pubs do 
    resources :answers
  end

  resources :users
  root 'pubs#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
