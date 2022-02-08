Rails.application.routes.draw do
  devise_for :users
  devise_for :admins
  root 'homes#top'
  get 'homes/about' => 'homes#about'
  
  namespace :admin do
    get 'admin/homes/top' => 'admin/homes#top'
    resources :items
  end
end
