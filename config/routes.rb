Rails.application.routes.draw do
  namespace :admin do
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


  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    root "homes#top"
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
