Rails.application.routes.draw do
  resources :jobcomments
  root :to => 'jobs#index'
  resources :assigns
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
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
