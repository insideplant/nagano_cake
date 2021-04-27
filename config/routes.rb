Rails.application.routes.draw do
  devise_for :rails
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :orders
  
end
