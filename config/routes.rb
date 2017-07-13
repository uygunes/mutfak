Rails.application.routes.draw do
  root to: "home#index"
  resources :controllers
  resources :birims
  resources :malzemes
  resources :yemeks
  resources :yemekmalzemes
  resources :menus
  resources :menuyemeks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
