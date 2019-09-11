# frozen_string_literal: true
class Hosts::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  layout :host
  def sign_up_success; end

  def after_inactive_sign_up_path_for(resource)
    host_sign_up_success_path
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :phone_number])
  end
end
