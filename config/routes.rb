Rails.application.routes.draw do
  resources :subscriptions
  resources :plans
  resources :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
