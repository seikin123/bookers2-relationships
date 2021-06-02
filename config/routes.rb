Rails.application.routes.draw do
  devise_for :users
  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
  resources :users
  root to: "homes#top"
  get "/home/about" => "homes#about"
  
  resources :books

  # フォロー機能
end
