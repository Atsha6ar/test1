Rails.application.routes.draw do
  get 'welcome/index'
  delete 'articles/destroy_comment/:id' => "articles#destroy_comment"

  resources :articles do
  	resources :comments
  end
 
  root 'welcome#index'
end