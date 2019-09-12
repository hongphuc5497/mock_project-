Rails.application.routes.draw do
  devise_for :hosts, controllers: {
    sessions: 'hosts/sessions'
  }
  
  root 'top#index', as: 'top'

  #middleware for pages
  match "/404", to: "errors#not_found", via: :all
  match "/422", to: "errors#unprocessable", via: :all
  match "/500", to: "errors#internal_server_error", via: :all 

  resources :blogs,       only: %i[index show]
  resources :experiences do
    member do 
      get 'application_form', to: 'experiences#application_form'
      get 'send_request',     to: 'experiences#send_request'
      get 'confirm',          to: 'experiences#confirm'
      get 'payment',          to: 'experiences#payment'
      get 'complete',         to: 'experiences#complete'
    end

    collection do 
      match 'search' => 'experiences#search', :via => [:get, :post], :as => :search
    end
  end
end
