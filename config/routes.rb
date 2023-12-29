Rails.application.routes.draw do
  get 'static_pages/home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "static_pages#home"
  resources :articles do
    resources :comments
  end

  # get "/articles", to: "articles#index"
  # get "/articles/:id", to: "articles#show"
end
