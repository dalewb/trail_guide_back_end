Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      post 'search', to: 'commodities#search'
      get 'user/locations/:id', to: 'users#show_user_locations'
      resources :bookings
      resources :commodities
      resources :locations
      resources :posts
      resources :users
    end
  end
end
