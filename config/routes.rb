Rails.application.routes.draw do
  resources :users
  resources :items
  resources :notes
  resources :tags
end
