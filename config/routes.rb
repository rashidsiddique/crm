Rails.application.routes.draw do
  

  devise_for :users, controllers: { 
    sessions: "users/sessions", 
    registrations: "users/registrations"
  }

  devise_for :admins, controllers: { 
    sessions: "admins/sessions", 
    registrations: "admins/registrations"
  }
  
  
  resources :products


  root to: "welcome#show"
end
