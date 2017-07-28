Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  scope 'api', module: :api do
    resources :currencies, only: [:index] do
      get '/quotations', to: 'quotations#index'
      get '/quotations/from_yesterday', to: 'quotations#from_yesterday'
      get '/quotations/from_last_week', to: 'quotations#from_last_week'
      get '/quotations/from_last_month', to: 'quotations#from_last_month'
    end
  end
end
