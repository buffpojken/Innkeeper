Innkeep::Application.routes.draw do
  resources :users

  resource :session, :only => [:new, :create, :destroy]

  match 'signup' => 'users#new', :as => :signup

  match 'register' => 'users#create', :as => :register

  match 'login' => 'sessions#new', :as => :login

  match 'logout' => 'sessions#destroy', :as => :logout

  resources :items do 
    member do
      get :delete
    end
  end

  root :to => "items#index", :constraints => lambda{|req| !req.session[:user_id].blank? }

  root :to => "sessions#new"


end
