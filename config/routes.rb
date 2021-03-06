Rails.application.routes.draw do

  # for posts action
  get 'posts/index'
  get 'posts/new', to: 'posts#new'
  get 'posts/:id', to: 'posts#show'
  post 'posts/create', to: 'posts#create'
  get 'posts/:id/edit', to: 'posts#edit'
  post 'posts/:id/update', to: 'posts#update'
  delete 'posts/:id/destroy', to: 'posts#destroy'

  # for user action
  get 'users/index', to: 'users#index'
  get 'users/signup', to: 'users#new'
  get 'users/login', to: 'users#login_form'
  post 'users/login', to: 'users#login'
  post 'users/logout', to: 'users#logout'
  post'users/create', to: 'users#create'
  get 'users/:id', to: 'users#show'
  get 'users/:id/edit', to: 'users#edit'
  post 'users/:id/update', to: 'users#update'
  get 'users/:id/likes', to: 'users#likes'

  # for like action
  post 'likes/:post_id/create', to: 'likes#create'
  delete 'likes/:post_id/destroy', to: 'likes#destroy'

  # for home action
  get 'home/top'
  get 'home/about'
  root 'home#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
