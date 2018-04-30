Rails.application.routes.draw do
  post 'blacklists', to: 'blacklists#create'
  post 'subscriptions', to: 'subscriptions#create'
  post 'friendships', to: 'friendships#create'
  get 'friends', to: 'friends#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
