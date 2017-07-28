Rails.application.routes.draw do
  resources :user_roles
  resources :mekan_stoks
  resources :stoks
  resources :mekans do
    member do
      get 'stok'
    end
  end
  resources :mekan_kategoris
  devise_for :users, path: '', path_names: { sign_in: 'giris', sign_up: 'kayit',
   sign_out: 'cikis'}
  resources :alt_yemeks
  resources :restorans
  resources :oguns
  root to: "home#index"
  resources :birims
  resources :malzemes
  resources :yemeks
  resources :yemekmalzemes
  resources :menus do
    member do
      get 'kopyala'
      get 'aktif'
    end
  end
  resources :menuyemeks
  resources :malzeme_kategoris
  resources :yemek_kategoris
  resources :restoran_yonetims
  
  get '/takvims/get_events_full', to: 'takvims#get_events_full'
  get '/takvim', to: 'takvims#index'
  get '/takvims/:id', to: 'takvims#show'
  get '/takvims/:id/get_events', to: 'takvims#get_events'
  get '/mekans/:id/get_restoran_ogun', to: 'mekans#get_restoran_oguns'
  get '/versions', to: 'takvims#view'
  get 'user_management', to: 'user_managements#index', as: 'user_management'
  get 'user_management/new', to: 'user_managements#new', as: 'new_user_management'
  post 'user_management/create', to: 'user_managements#create', as: 'createuser_management'
  get 'user_management/:id', to: 'user_managements#show', as: 'show_user_management'
  get 'user_management/:id/destroy', to: 'user_managements#destroy', as: 'destroy_user_management'
  get 'user_management/:id/edit', to: 'user_managements#edit', as: 'edit_user_management'
  get 'siparis_formu/form', to: 'siparis_formus#form', as: 'form_siparis_formu'
  post 'siparis_formu/kaydet', to: 'siparis_formus#kaydet', as: 'kaydet_siparis_formu'
  
  patch 'user_management/:id/update', to: 'user_managements#update', as: 'update_user_management'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
