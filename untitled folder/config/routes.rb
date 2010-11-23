
ActionController::Routing::Routes.draw do |map|

  map.resources :users, :member => { :following => :get, :followers => :get }

  map.resources :users

  map.resources :sessions, :only => [:new, :create, :destroy]

  map.resources :microposts, :only => [:create, :destroy]

  map.resources :relationships, :only => [:create, :destroy]

  map.signin '/signin', :controller => 'sessions', :action => 'new'

  map.signout '/signout', :controller => 'sessions', :action => 'destroy'

  map.contact '/contact', :controller => 'pages', :action => 'contact'

  map.about '/about', :controller => 'pages', :action => 'about'

  map.help '/help', :controller => 'pages', :action => 'help'

  map.signup '/signup', :controller => 'users', :action => 'new'

  map.simulate '/simulate', :controller => 'simulate', :action =>'simulate'

  map.search '/search', :controller => 'simulate', :action => 'search'

  map.result '/result', :controller => 'simulate', :action => 'result'

  map.check_status '/status', :controller => 'simulate', :action => 'check_status'
  
  map.root :controller => 'pages', :action => 'home'
 
end

