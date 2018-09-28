Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
namespace :v1 do
  post 'user/create', to: 'users#create'
  get 'user/show/:id', to: 'users#show'
  get 'user/index', to: 'users#index'
  post 'tweet/:id', to: 'tweets#create'
  get 'tweet/show/:id/:tweets_id', to: 'tweets#show'
  get 'tweet/all/:id',to: 'tweets#showall'
end
end
