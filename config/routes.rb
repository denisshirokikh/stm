Rails.application.routes.draw do

  resources :projects
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'projects#index'

  resources :projects do
    resources :testmodule, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  end
  #resources :testmodule, only: [:show, :edit, :update, :destroy]}

end
