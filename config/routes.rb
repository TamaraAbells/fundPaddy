Rails.application.routes.draw do
  
  root 'static_pages#home'

  get 'static_pages/about'

  get 'static_pages/how-it-works', to: 'static_pages#howitworks'

  get 'static_pages/promotions'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
