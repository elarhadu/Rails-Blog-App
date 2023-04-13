Rails.application.routes.draw do
  root "users#index"

  get 'posts/:id', to: 'posts#show', as: 'post'
  resources :users, only: [:index, :show, :new] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:new, :create]
        resources :likes, only: [:new]
  end
  end
end