Rails.application.routes.draw do
  root to: "homes#top"
  get "homes/about" => "homes#about", as: 'about'
  # resourcesはメソッドで、ルーティングを一括して自動生成してくれる機能を持つ
  devise_for :users
  resources :post_images, only: [:new, :index, :show, :create, :destroy] do
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
  # resources(複数形)の場合ではdestroyアクションのURLは最後に/:idが付いていたことを思い出してください。
  # resourceにしたことで/:idがない形でURLが生成されているのが確認できます。
end