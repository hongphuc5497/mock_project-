Rails.application.routes.draw do
  get 'blog/index'
  get 'blog/show'

  root 'top#index', as: 'top'
end
