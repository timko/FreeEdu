FreEdu::Application.routes.draw do
  
  #Homepage is the courses page
  root :to => 'courses#index'
  
  #Built-in scaffolding to get template routes
  resources :users, :except => [:index]
  resources :courses do
    resources :videos
  end
 
  #Manual route configuration
  match '/login' => 'sessions#create', :as => 'login'
  match '/logout' => 'sessions#destroy', :as => 'logout'
  match '/auth' => 'sessions#index', :as => 'auth'
  match '/settings' => 'users#edit', :as => 'settings'
  match '/users/new' => 'users#new', :as => 'new_users'
  match 'statistics/total' => 'cache_statistics#total_stats', :as => 'total_stats', :via => :get
  match 'statistics/:fields' => 'cache_statistics#field_stats', :as => 'field_stats', :via => :get
end
