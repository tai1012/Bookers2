Rails.application.routes.draw do
  # get 'users/show'

  root to: 'homes#top'
  get 'home/about' => 'homes#about'

  devise_for :users

                        # [:new,]delete
  resources :books, only:[:create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:index, :show, :edit, :update]
end
