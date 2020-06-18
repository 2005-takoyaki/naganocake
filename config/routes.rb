Rails.application.routes.draw do
  # デバイス
  devise_for :customers, skip: :all
  devise_scope :customer do
    get '/customers/sign_in', to: 'customers/sessions#new'
    post '/customers/sign_in', to: 'customers/sessions#create'
    delete '/customers/sign_out', to: 'customers/sessions#destroy'
    get '/customers/sign_up', to: 'customers/registrations#new'
    post '/customers', to: 'customers/registrations#create'
  end

  #ルート設定
  root "products#top"

  #顧客
  resource :customers, only: [:show,:edit,:update] do
    get :leave, on: :collection
    patch :left, on: :member
  end
  namespace :admin do
    resources :customers, only: [:index,:show,:edit,:update]
  end

  #ログイン
  namespace :admin do
    get '/sign_in', to: 'admin#new'
    post '/sign_in', to: 'admin#create'
    delete '/sign_out', to: 'admin#destroy'
  end

  #商品
  resources :products, only: [:index,:show] do
    get :top, on: :collection
  end
  namespace :admin do
    resources :products, only: [:index,:new,:show,:edit,:create,:update]
  end

  #配送先
  resources :ships, only: [:index,:edit,:update,:create,:destroy]

  #ジャンル
  namespace :admin do
    resources :genres, only: [:index,:edit,:update,:create]
  end

  #カートの商品
  post '/cart_products', to: 'cart_products#add'
  resources :cart_products, only: [:index,:destroy,:update] do
    delete :destroy_all, on: :collection
  end

  # 注文
  resources :orders, only: [:index,:show,:new,:create] do
    get :confirmation, on: :collection
    get :complete, on: :collection
  end
  namespace :admin do
    resources :orders, only: [:index,:show,:update]
    patch '/order_products/:id', to: 'orders#products_update'
  end



end
