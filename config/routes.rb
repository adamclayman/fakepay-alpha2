Rails.application.routes.draw do
  scope '/api' do
    scope '/alpha2' do
      resources :subscriptions
      resources :plans
      resources :customers
    end
  end
end
