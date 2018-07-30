Rails.application.routes.draw do
  scope '/api' do
    scope '/alpha2' do
      resources :subscriptions, as: 'subscriptions'
      resources :plans, as: 'plans'
      resources :customers, as: 'customers'
    end
  end
end