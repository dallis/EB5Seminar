EB5Seminar::Application.routes.draw do
  resources :documents
  resources :sponsors
  resources :speakers

  root :to => "home#index"

  match '/agenda', :to => "home#agenda"
  match '/speakers', :to => "home#speakers"
  match '/venue', :to => "home#venue"
  match '/sponsors', :to => "home#sponsors"
  match '/resources', :to => "home#resources"
  match '/contact', :to => "home#contact"

  match "/sitemap.xml", :controller => "home", :action => "sitemap", :format => 'xml'
end