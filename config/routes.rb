Rails.application.routes.draw do
  # get 'users/show'
  devise_for :users
  root to: 'homes#top'

                        # [:new,]delete
  resources :users, only: [:show, :edit]
  resources :books, only:[:create, :index, :show, :destroy]
end
