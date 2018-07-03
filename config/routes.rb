Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      post 'search', to: 'commodities#search'
      get 'bookings/locations/:id', to: 'bookings#get_user_bookings'
      resources :bookings
      resources :commodities
      resources :locations
      resources :posts
      resources :users
    end
  end
end
