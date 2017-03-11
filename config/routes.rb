Rails.application.routes.draw do
  
  
  devise_for :members, :path => 'account'

  resources :members do
  	resources :donations
    resources :withdrawals
  end

  get 'office/settings'

  get 'office/blocked', to: 'static_pages#blocked', as: 'blocked_members'

  post 'static_pages/send_message', to: 'static_pages#send_message', as: 'send_message'

  get 'office/profile', to: 'office#profile', as: 'profile'
  
  post 'donation/payment_conf', to: 'donations#payment_conf', as: 'payment_confirmation'
  get 'donation/confirm', to: 'donations#donation_confirm', as: 'donation_confirmation'

  get 'office/restricted', to: 'office#restricted', as: 'restricted'

  get 'office/dispatcher', to: 'office#dispatcher', as: 'dispatcher'

  get 'office/rematcher', to: 'office#rematcher', as: 'rematcher'

  resources :accounts
  


  get '/office', to: 'office#index', as: 'office'
  
  get 'office/index'

  root 'static_pages#home'

  get 'static_pages/about'

  get 'static_pages/how-it-works', to: 'static_pages#howitworks'

  get 'static_pages/promotions'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
