Rails.application.routes.draw do

  namespace :public do
    get 'relationships/followings'
    get 'relationships/followers'
  end

  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    root :to => "homes#top"
    get "posts/select_prefecture"
    get "posts/new/:id" => "posts#new", as: "post_new"
    resources :posts, only: [:index, :show, :create] do
      resources :comments, only: [:create]
      resources :bookmarks, only: [:create, :destroy]
    end
    resources :prefectures, only: [:show]
    resources :regions, only: [:index]
    resources :users, only: [:show] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
  end

end
