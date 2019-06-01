Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "callbacks", registrations: "registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 root 'recording_sessions#index'
 get '/artists/search' => 'artists#search', :as => "artists_search"
 post '/artists/filtered' => 'artists#filtered', :as => "artists_filtered"
 get '/artists/filtered' => 'artists#filtered'
 

   resources  :studios, :recording_sessions, :engineers, :artists, :comments
#resources :photos, :only => [:index, :show]
  # resources :studios do
  #   resources :recording_sessions#, :only => [:create, :show]
  # end
  # resources :engineers do
  #   resources :recording_sessions#, :only => [:index, :show, :new, :edit]
  # end
  resources :artists do #, #shallow: true do 
    resources :comments#, :only => [:index, :show, :new, :edit]
  end

  
  resources :artists do #, #shallow: true do 
    resources :recording_sessions#, :only => [:index, :show, :new, :edit]
  end

  #get 'comments', to: 'comments#index', as

#   devise_scope :users do
#     get 'login', to: 'devise/sessions#new'
#   end
#  devise_scope :users do
#     get 'logout', to: 'devise/sessions#destroy'
#   end

end
