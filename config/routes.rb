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
  get '/takvims/get_events_full', to: 'takvims#get_events_full'
  get '/takvim' ,to: 'takvims#index'
  get '/takvims/:id' ,to: 'takvims#show'
  get '/takvims/:id/get_events', to: 'takvims#get_events'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
