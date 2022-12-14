Rails.application.routes.draw do

  namespace :public do
    get 'relationships/followings'
    get 'relationships/followers'
  end

  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    root :to => "homes#top"
    get "homes/about"
    get "posts/select_prefecture"
    get "posts/new/:id" => "posts#new", as: "post_new"
    resources :posts, only: [:index, :show, :create, :update] do
      resources :comments, only: [:create]
      resources :bookmarks, only: [:create, :destroy]
    end
    resources :image_tags, only: [:destroy]
    resources :area_ratings, only: [:create]
    resources :records, only: [:create, :update, :destroy]
    resources :areas, only: [:show]
    resources :prefectures, only: [:show]
    resources :regions, only: [:index]
    resources :information, only: [:index, :show]
    resources :users, only: [:show, :update] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
  end

  namespace :admin do
    root :to =>"homes#top"
    resources :posts, only: [:index, :show, :update, :destroy]
    resources :users, only: [:index, :show, :update]
    resources :areas, only: [:index, :create, :destroy, :update]
    resources :species, only: [:index, :create, :destroy]
    resources :fishing_methods, only: [:index, :create, :destroy]
    resources :information, only: [:index, :create, :destroy, :update]
  end

end
