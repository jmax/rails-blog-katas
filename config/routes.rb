Rails.application.routes.draw do
  get 'home/index'

  # get    'articles'          => 'articles#index'
  # get    'articles/new'      => 'articles#new'
  # post   'articles'          => 'articles#create'
  # get    'articles/:id'      => 'articles#show'
  # get    'articles/:id/edit' => 'articles#edit'
  # patch  'articles/:id'      => 'articles#update'
  # delete 'articles/:id'      => 'articles#destroy'

  resources :articles do
    member do
      put :feature
      put :unfeature
    end

    resources :comments, only: [:create]
  end

  root to: "home#index"
end
