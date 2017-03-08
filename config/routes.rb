Rails.application.routes.draw do
  
  
  devise_for :members, :path => 'account'

  resources :members do
  	resources :donations
    resources :withdrawals
  end

  get 'office/settings'
  
  resources :accounts
  


  get '/office', to: 'office#index', as: 'office'
  
  get 'office/index'

  root 'static_pages#home'

  get 'static_pages/about'

  get 'static_pages/how-it-works', to: 'static_pages#howitworks'

  get 'static_pages/promotions'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
