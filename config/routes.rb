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

  # return json objects to api call
  get "/post/:id/question_1", to: "posts#question_1"
  get "/post/:id/question_2", to: "posts#question_2"
  get "/post/:id/question_3", to: "posts#question_3"


  resources :users do
    resources :posts 
  end

  resources :posts do
    resources :comments
  end
  
end
