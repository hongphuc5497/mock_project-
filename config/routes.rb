Rails.application.routes.draw do
  root 'top#index', as: 'top'

  resources :blog, only: %i[index show]
end
