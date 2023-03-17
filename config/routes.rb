Rails.application.routes.draw do
  namespace :admin do
    get 'items/new'
    get 'items/index'
    get 'items/show'
    get 'items/edit'

    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
    
  end
  namespace :admin do
    get 'homes/top'
  end
  root to: 'homes#top'
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  get 'about' => "homes#about"

  scope module: :public do
    resources :deliveries, only: [:index, :edit, :create, :update, :destroy,]
  end
  scope module: :public do
    get 'customers/mypage' => 'customers#show'
    get 'customers/mypage/edit' => 'customers#edit'
    get 'customers/mypage' => 'customers#update'
  end


  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    root to: "homes#top"
    resources :items
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
