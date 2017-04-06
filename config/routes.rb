Rails.application.routes.draw do
  # get('/posts' => 'posts#show')
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  root 'posts#index'
end
