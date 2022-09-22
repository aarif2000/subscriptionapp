Rails.application.routes.draw do

  # devise_for :users

    devise_for :users, controllers: {
      sessions: 'users/sessions'
    }
  
  root 'static_public#landing_page'
  # get 'static_public/landing_page'

  get 'privacy', to: 'static_public#privacy'
  get 'terms', to: 'static_public#terms'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
