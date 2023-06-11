Rails.application.routes.draw do
  devise_for :users
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "pages#index" 
  get "/report_case", to: "pages#report"
  get "/show_all_cases", to: "pages#show_all"
  get "/ai_feature", to: "pages#ai_feature"
end
