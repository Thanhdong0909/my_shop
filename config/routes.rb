Rails.application.routes.draw do
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout', :edit => 'profile', :confirmation => 'confirmations'}
  resources :users
  resources :products
  resources :categories do
    resources :products
  end
  root "static_pages#home"

  get "static_pages/home"
  get "static_pages/about"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
