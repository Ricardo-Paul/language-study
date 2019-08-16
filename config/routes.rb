Rails.application.routes.draw do
  
  get 'groups/new'
  get 'answers/new'
  get 'bootfront/page1'
  devise_for :users

  resources :pubs do 
    resources :answers
  end

  #get 'add_member' => 'groups#add_member'
  resources :groups do 
    patch 'add_user'
    resources :users, only: [:create]
    resources :group_pubs
  end

  resources :users
  root 'pubs#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
