Rails.application.routes.draw do

  devise_for :users

  root 'projects#index'

  resources :projects do
    resources :testmodules do
      resources :testcases
    end

  end

end
