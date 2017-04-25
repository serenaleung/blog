Rails.application.routes.draw do
  # get('/posts' => 'posts#show')

  namespace :admin do
    resources :dashboard, only: [:index]
  end

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  resources :categories, only: [:show]

  resources :about, only: [:index]

  resources :users, only: [:new, :edit, :create, :update]

# prevents password to show in address bar
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  root 'posts#index'
end
