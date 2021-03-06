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
  match '/agenda/:city_id', :to => "home#agenda", :as => :agenda_city

  match '/costs', :to => "home#costs"
  match '/costs/:city_id', :to => "home#costs", :as => :costs_city

  match '/speakers', :to => "home#speakers"
  match '/speakers/:city_id', :to => "home#speakers", :as => :speakers_city
  
  match '/venue', :to => "home#venue"
  
  match '/sponsors', :to => "home#sponsors"
  match '/sponsors/:city_id', :to => "home#sponsors", :as => :sponsors_city

  match '/resources', :to => "home#resources"
  match '/contact', :to => "home#contact"

  match '/about', :to => "home#about"

  match "/sitemap.xml", :controller => "home", :action => "sitemap", :format => 'xml'
end