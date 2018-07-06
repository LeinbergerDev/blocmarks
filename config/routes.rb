Rails.application.routes.draw do

  get 'likes/index'
  get 'incoming/create'
  post :incoming, to: 'incoming#create'

  resources :topics do
    resources :bookmarks, only: [:show, :new, :edit, :update, :destroy, :create] do
      resources :likes, only: [:index]
    end 
  end
  resources :bookmarks, except: [:index] do
    resources :likes, only: [:create, :destroy]
  end
  get 'mytopics/', to: 'topics#mytopics', as: :mytopics

  devise_for :users
  get 'welcome/index'

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
