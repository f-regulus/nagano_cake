Rails.application.routes.draw do
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
  end
  root to: 'homes#top'
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  get 'about' => "homes#about"

  scope module: :public do
    resources :deliveries, only: [:index, :edit, :create, :update, :destroy,]
    get 'customers/mypage' => 'customers#show'
    get 'customers/mypage/edit' => 'customers#edit'
    patch 'customers/mypage' => 'customers#update'
    get 'customers/unsubscribe'
    patch 'customers/withdrawal'
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
