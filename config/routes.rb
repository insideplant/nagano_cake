Rails.application.routes.draw do

  devise_for :admins
  devise_for :customers

  scope module: :public  do
    root to: 'homes#top'
    get '/about' => 'homes#about'
    resources :customers, only:[:show, :edit, :update, :active_confirm, :not_active]
    resources :addresses, only:[:index, :edit, :create, :update, :destroy]
    resources :orders, only:[:new, :confirm, :complete, :create, :index, :show]
    resources :cart_items, only:[:index, :update, :destroy, :destroy_all, :create]
    resources :items, only:[:show, :index]
  end

  namespace :admin do
    root to: 'homes#top'
    get 'order_details/update'
    resources :customers, only:[:index, :show, :edit, :update]
    resources :orders, only:[:edit, :update]
    resources :genres, only:[:index, :create, :edit, :update]
    resources :products, only:[:index, :new, :create, :show, :edit, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
