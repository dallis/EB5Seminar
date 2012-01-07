EB5Seminar::Application.routes.draw do
  resources :documents
  resources :sponsors
  resources :speakers

  root :to => "home#index"
end