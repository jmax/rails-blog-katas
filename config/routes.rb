Rails.application.routes.draw do
  # get    'articles'          => 'articles#index'
  # get    'articles/new'      => 'articles#new'
  # post   'articles'          => 'articles#create'
  # get    'articles/:id'      => 'articles#show'
  # get    'articles/:id/edit' => 'articles#edit'
  # patch  'articles/:id'      => 'articles#update'
  # delete 'articles/:id'      => 'articles#destroy'

  resources :articles do
    resources :comments, only: [:create]
  end
end
