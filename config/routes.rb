Rails.application.routes.draw do

  namespace :admin do
    get 'homes/top'
   resources :customers, only: [:index,:show,:edit,:update]
  end

  root to: 'homes#top'
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  get 'about' => "homes#about"

  scope module: :public do
    get 'customers/mypage' => 'customers#show'
    get 'customers/mypage/edit' => 'customers#edit'
    patch 'customers/mypage' => 'customers#update'
    get 'customers/unsubscribe'
    patch 'customers/withdrawal'
    resources :deliveries, only: [:index, :edit, :create, :update, :destroy]
    resources :orders, only: [:new, :index, :show, :create, :confirm, :success]
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/success' => 'orders#success'
  end

  scope module: :public do
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
    delete 'cart_items' => 'cart_items#destroy_all'
  end

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    root to: "homes#top"
    resources :items
    resources :genres, only: [:index, :edit, :create, :update]
  end
  
  get '/search', to: 'searches#search'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
