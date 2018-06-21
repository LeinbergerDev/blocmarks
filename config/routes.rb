Rails.application.routes.draw do
  get 'bookmarks/show'
  get 'bookmarks/new'
  get 'bookmarks/edit'
resources :topics do
  resources :bookmarks, only: [:show, :new, :edit, :update, :destroy, :create] 
end


  devise_for :users
  get 'welcome/index'

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
