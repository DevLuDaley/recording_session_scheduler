Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks", registrations: "registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 root 'recording_sessions#index'
 
   resources  :studios, :recording_sessions, :engineers, :artists


#   devise_scope :users do
#     get 'login', to: 'devise/sessions#new'
#   end
#  devise_scope :users do
#     get 'logout', to: 'devise/sessions#destroy'
#   end










end
