EB5Seminar::Application.routes.draw do  

  

  namespace :admin do
    match '/', :to => 'dashboard#welcome'
    resources :speakers
    resources :sponsors
    resources :documents
    resources :pages
    resources :page_blocks
    resources :cities
    resources :practice_areas
    resources :languages
  end 

  namespace :dashboard do
    resources :asset_photos, :except => [:destroy]
    resources :assets, :except => [:destroy]
  end   

  root :to => "home#index"

  match '/agenda', :to => "home#agenda"
  match '/speakers', :to => "home#speakers"
  match '/venue', :to => "home#venue"
  match '/sponsors', :to => "home#sponsors"
  match '/resources', :to => "home#resources"
  match '/contact', :to => "home#contact"

  match "/sitemap.xml", :controller => "home", :action => "sitemap", :format => 'xml'
end