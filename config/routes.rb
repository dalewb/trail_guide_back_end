Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      post 'search', to: 'commodities#search'
      get 'bookings/locations/:id', to: 'bookings#get_user_bookings'
      get 'posts/:user_id', to: 'posts#get_user_posts'
      resources :bookings
      resources :commodities
      resources :locations
      resources :posts
      resources :users
    end
  end
end
