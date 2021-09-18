Rails.application.routes.draw do
  # get 'users/show'
  devise_for :users
  root to: 'homes#top'

                        # [:new,]delete
  resources :books, only:[:create, :index, :show, :edit,  :destroy]
  resources :users, only: [:index, :show, :edit, :update]
end
