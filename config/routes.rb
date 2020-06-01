Rails.application.routes.draw do
  resources :customers
  resources :drivers
  resources :pages 

  get "about", to: "pages#about"
  get "home", to: "pages#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
