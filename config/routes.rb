
ActionController::Routing::Routes.draw do |map|
  map.resources :users

  map.resources :sessions, :only => [:new, :create, :destroy]

  map.resources :microposts, :only => [:create, :destroy]

  map.signin '/signin', :controller => 'sessions', :action => 'new'

  map.signout '/signout', :controller => 'sessions', :action => 'destroy'

  map.contact '/contact', :controller => 'pages', :action => 'contact'

  map.about '/about', :controller => 'pages', :action => 'about'

  map.help '/help', :controller => 'pages', :action => 'help'

  map.signup '/signup', :controller => 'users', :action => 'new' 

  # map.microposts '/microposts', :controller =>'microposts', :action => 'create'

  map.root :controller => 'pages', :action => 'home'
 
end

