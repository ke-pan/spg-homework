Rails.application.routes.draw do
  post 'blacklists', to: 'blacklists#create'
  get 'common_friends', to: 'common_friends#index'
  get 'friends', to: 'friends#index'
  post 'friendships', to: 'friendships#create'
  post 'subscriptions', to: 'subscriptions#create'
  get 'updates', to: 'updates#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
