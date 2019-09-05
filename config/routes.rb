Rails.application.routes.draw do
  root 'top#index', as: 'top'

  #middleware for pages
  match "/404", to: "errors#not_found", via: :all
  match "/422", to: "errors#unprocessable", via: :all
  match "/500", to: "errors#internal_server_error", via: :all 

  resources :blog, only: %i[index show]

devise_for :hosts, controllers: {
  sessions: 'hosts/sessions',
  confirmations: 'hosts/confirmations',
  passwords: 'hosts/passwords',
  registrations: 'hosts/registrations'
}

devise_scope :host do
  get "/hosts/sign_up_success", to: "hosts/registrations#sign_up_success", as: :host_sign_up_success
  put "/hosts/confirmation", to: "hosts/confirmations#update", as: :host_confirm
  get "/hosts/resend_confirmation_success", to: "hosts/confirmations#resend_confirmation_success", as: :host_resend_confirmation_success
  get "/hosts/change_password_success", to: "hosts/confirmations#change_password_success", as: :host_change_password_success
  get "/hosts/reset_password_complete", to: "hosts/passwords#reset_password_complete", as: :host_reset_password_complete
  get '/hosts/update_password_complete', to: 'hosts/passwords#update_password_complete', as: :host_update_password_complete
end

namespace :hosts do
  get '/', to: 'dashboard#index', as: :dashboard
end

end
