Rails.application.routes.draw do
  get    'articles'          => 'articles#index'
  get    'articles/new'      => 'articles#new'
  post   'articles'          => 'articles#create'
  get    'articles/:id/edit' => 'articles#edit'
  patch  'articles/:id'      => 'articles#update'
  delete 'articles/:id'      => 'articles#destroy'
end
