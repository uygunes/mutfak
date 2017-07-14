Rails.application.routes.draw do
  
  resources :restorans
  resources :oguns
  root to: "home#index"
  resources :controllers
  resources :birims
  resources :malzemes
  resources :yemeks
  resources :yemekmalzemes
  resources :menus
  resources :menuyemeks
  resources :malzeme_kategoris
  resources :yemek_kategoris
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
