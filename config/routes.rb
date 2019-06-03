Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "callbacks", registrations: "registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 root 'recording_sessions#index'

get "/past_sessions" => 'recording_sessions#past_sessions'
# controller
    # scope
    # view



   resources  :studios, :recording_sessions, :engineers, :artists, :comments
  resources :artists do #, #shallow: true do 
    resources :comments#, :only => [:index, :show, :new, :edit]
  end

  resources :artists do #, #shallow: true do 
    resources :recording_sessions#, :only => [:index, :show, :new, :edit]
    end

end
