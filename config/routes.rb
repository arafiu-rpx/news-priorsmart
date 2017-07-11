Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :rss_feeds, only: [:create]
  get '/status/database_read_health', to: 'status#database_read_health'
end
