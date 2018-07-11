Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      post 'search', to: 'commodities#search'
      get ':id/bookings', to: 'bookings#get_user_bookings'
      get ':user_id/posts/commodities', to: 'posts#get_user_commodities'
      get ':user_id/posts', to: 'posts#get_user_posts'
      resources :bookings
      resources :commodities
      resources :locations
      resources :posts
      resources :users
    end
  end
end
