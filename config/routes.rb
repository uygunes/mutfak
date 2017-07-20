Rails.application.routes.draw do
  
  devise_for :users, path: '',path_names: {sign_in: 'giris', sign_up: 'kayit', sign_out: 'cikis'}
  resources :alt_yemeks
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
  resources :restoran_yonetims
  get '/takvims/get_events_full', to: 'takvims#get_events_full'
  get '/takvim' ,to: 'takvims#index'
  get '/takvims/:id' ,to: 'takvims#show'
  get '/takvims/:id/get_events', to: 'takvims#get_events'
  get '/versions', to: 'takvims#view'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
