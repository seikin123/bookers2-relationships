Rails.application.routes.draw do
  devise_for :users
  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
  resources :users do
    get :follow, on: :member
    get :follower, on: :member
  end
  root to: "homes#top"
  get "/home/about" => "homes#about"
  
  resources :books

  # フォロー機能
end
