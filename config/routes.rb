Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      get '/search/:query', to: 'commodity#search'
      resources :bookings
      resources :commodities
      resources :locations
      resources :posts
      resources :users
    end
  end
end
