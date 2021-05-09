Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions: "admins/sessions",
    registrations: "admins/registrations"
  }

  devise_for :customers, controllers: {
    sessions: "customers/sessions",
    registrations: "customers/registrations"
  }

  scope module: :public  do
    root to: 'homes#top'
    get '/about' => 'homes#about'
    get '/customers/mypage' => 'customers#show'
    get '/customers/mypage/edit' => 'customers#edit'
    get '/customers/acitve_confirm' => 'customers#active_confirm'
    patch '/customers/mypage/update' => 'customers#update'
    patch '/customers/not_active' => 'customers#not_active'

    resources :orders do
     collection do
     post :confirm
     get :complete
     end
    end
   
    resources :addresses, only:[:index, :edit, :update, :destroy]
    resources :items, only:[:show, :index]
    
    resources :cart_items, only:[:index, :update, :destroy, :create]
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    
  end

  namespace :admin do
    root to: 'homes#top'
    get 'order_details/update'
    resources :customers, only:[:index, :show, :edit, :update]
    resources :orders, only:[:index, :edit, :update]
    resources :genres, only:[:index, :create, :edit, :update]
    resources :products, only:[:index, :new, :create, :show, :edit, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
