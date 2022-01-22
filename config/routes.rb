Rails.application.routes.draw do
root 'homes#top'
  resources :todolists
end
