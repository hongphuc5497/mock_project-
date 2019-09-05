Rails.application.routes.draw do
  resources :blog, only: %i[index show]

  root 'top#index', as: 'top'
end
