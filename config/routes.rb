Rails.application.routes.draw do
  resources :comments
  devise_for :users
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "pages#index" 
  get "/report_case", to: "pages#report"
  get "/show_all_cases", to: "pages#show_all"
  get "/ai_feature", to: "pages#ai_feature"
  get "/user/:id/edit", to: "devise/registrations#edit"
  get "/post/:id/detail", to: "posts#detail", as: "show_post_detail"
  get "/apitest", to: "posts#keyword_extractor"

  resources :users do
    resources :posts 
  end

  resources :posts do
    resources :comments
  end
  
end
