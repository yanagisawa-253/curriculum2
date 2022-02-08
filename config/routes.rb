Rails.application.routes.draw do
  devise_for :users
  devise_for :admins
  root 'homes#top'
  get 'homes/about' => 'homes#about'
  
  resources :items
  resources :cart_items
  resources :users do
    get '/unsubscribe' => 'customers#unsubscribe'
    patch '/withdraw' => 'customers#withdraw', as: 'withdraw_customer'
  end

  
  namespace :admin do
    get 'admin/homes/top' => 'admin/homes#top'
    resources :items
  end
end
