Rails.application.routes.draw do
  get 'users/show'
  root :to => 'jobs#index'
  namespace :jobs do
    post 'hide_comment'
    post 'create_comment'
    end
  resources :assigns
  devise_for :users
  resources :jobs do
    member do
      post 'create_message'
      get 'worker_list'
      get 'chat'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
