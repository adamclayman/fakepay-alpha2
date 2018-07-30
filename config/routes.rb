Rails.application.routes.draw do
  scope '/api' do
    scope '/alpha2' do
      resources :customers, as: 'customers'
      resources :subscriptions, as: 'subscriptions'
      resources :plans, as: 'plans'
    end
  end
end