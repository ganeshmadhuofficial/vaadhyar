Rails.application.routes.draw do

  apipie

  namespace :api do
    scope :v1 do
      mount_devise_token_auth_for "User", at: 'auth'
    end
  end

  resources :users

  root 'home#index'

end
