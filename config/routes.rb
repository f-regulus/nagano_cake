Rails.application.routes.draw do

  namespace :admin do
    root to: "homes#top"
    resources :customers, only: [:index,:show,:edit,:update]
    resources :orders, only:[:index,:show,:update] do
      resource :order_details,only:[:update]
    end
    resources :items
    resources :genres, only: [:index, :edit, :create, :update, :destroy]
  end

  root to: 'homes#top'
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  get 'about' => "homes#about"

  scope module: :public do
    get 'customers/mypage' => 'customers#show'
    patch 'customers/mypage' => 'customers#update'
    get 'customers/mypage/edit' => 'customers#edit'
    get 'customers/unsubscribe'
    patch 'customers/withdrawal'
    resources :deliveries, only: [:index, :edit, :create, :update, :destroy]
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/success' => 'orders#success'
    resources :orders, only: [:index, :new, :create, :show]
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
    delete 'cart_items' => 'cart_items#destroy_all'
  end

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
  end

  get '/search', to: 'searches#search'
  get '/genre_search', to: 'searches#genre_search'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
