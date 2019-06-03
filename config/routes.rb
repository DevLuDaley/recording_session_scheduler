Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "callbacks", registrations: "registrations"}

 root 'recording_sessions#index'
   resources  :studios, :recording_sessions, :engineers, :artists, :comments

   resources :artists do #, #shallow: true do
      resources :comments#, :only => [:index, :show, :new, :edit]
   end

    resources :artists do #, #shallow: true do
      resources :recording_sessions#, :only => [:index, :show, :new, :edit]
    end
end
