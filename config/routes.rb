Rails.application.routes.draw do
  get 'sales_reports/index'
  post "generate_sales_reports", to: "sales_reports#generate"
  root "products#new"
  resources :reserve_or_purchases, except: [:show]  
  resources :customers, except: [:show]  
  resources :change_histories, except: [:show]  
  resources :suppliers, except: [:show]  
  resources :products, except: [:show]  


  namespace :authentication, path: '', as: '' do
    resources :users, only: [:index,:new, :create]
    resources :sessions, only: [:new, :create, :destroy]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end