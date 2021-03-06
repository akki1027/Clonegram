Rails.application.routes.draw do
  resources :post_images, only:[:new, :create, :index, :show, :edit, :destroy] do
  	resource :post_comments, only:[:create, :destroy]
  	resource :favorites, only:[:create, :destroy]
  end
  resources :users, only:[:show]
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'post_images#index'
end
