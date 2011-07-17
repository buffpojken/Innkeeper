Innkeeper::Application.routes.draw do

  match 'login' => 'sessions#new', :as => :login
  
  match 'logout' => 'sessions#destroy', :as => :logout
  resource :session, :only => [:new, :create, :destroy]

  resources :users

  resources :items do 
    member do
      get :delete
    end
  end

  root :to => "items#index", :constraints => lambda{|req| !req.session[:user_id].blank? }

  root :to => "sessions#new"
end
