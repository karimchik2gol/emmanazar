Rails.application.routes.draw do
  resources :orders
  resources :brokers do
    get :calculate, on: :member
  end
  resources :apartments
  resources :order_yurists
  resources :zabydovnuks
  resources :projects do
  	collection do
  		get :upload_apartments
  	end
  end
  resources :physicals
  resources :yurists
  resources :people
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "people#index"
end
