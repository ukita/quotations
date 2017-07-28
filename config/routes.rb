Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  scope 'api', module: :api do
    resources :currencies, only: [:index]
  end
end
