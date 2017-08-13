Rails.application.routes.draw do
  resources :products
  get 'static_pages/about'

  get '/about' =>'static_pages#about'

  get 'static_pages/contact'

  get '/contact' =>'static_pages#contact'

  get 'static_pages/landing_page' =>'static_pages#landing_page'
  
  get '/landing_page' =>'static_pages#landing_page'
  
  get 'static_pages/index'

  post 'static_pages/thank_you'

  get 'static_pages/thank_you' => redirect('/contact')

	root 'static_pages#index'

	resources :orders, only: [:index, :show, :create, :destroy]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
