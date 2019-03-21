Rails.application.routes.draw do

  devise_for :users

  root 'projects#index'

  resources :projects do
    resources :testmodules do
      member do
        get :copy
        end
      resources :testcases
    end

  end

end
