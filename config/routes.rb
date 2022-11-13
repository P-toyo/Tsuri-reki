Rails.application.routes.draw do
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    root :to => "homes#top"
    resources :posts, only: [:new, :index, :show, :create] do
      resources :comments, only: [:create]
      resources :bookmarks, only: [:create, :destroy]
    end
    resources :prefectures, only: [:index, :show]
    resources :regions, only: [:index]
    resources :users, only: [:show]
  end

end
