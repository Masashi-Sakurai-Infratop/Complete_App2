Rails.application.routes.draw do
  root to: "homes#top"
  # resourcesはメソッドで、ルーティングを一括して自動生成してくれる機能を持つ
  devise_for :users
  get "homes/about" => "homes#about", as: 'about'
  resources :post_images, only: [:new, :index, :show, :create, :destroy]
  resources :users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end