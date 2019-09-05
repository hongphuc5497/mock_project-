Rails.application.routes.draw do
  root 'top#index', as: 'top'

  #middleware for pages
  match "/404", to: "errors#not_found", via: :all
  match "/422", to: "errors#unprocessable", via: :all
  match "/500", to: "errors#internal_server_error", via: :all 

  resources :blog, only: %i[index show]
end
