# frozen_string_literal: true

class Hosts::PasswordsController < Devise::PasswordsController
  before_action :find_host, only: [:create]

  def create
    return render_error(:not_found) unless @host
    return render_error(:no_confirmed, @host) unless @host.confirmed?

    super
  end

  def update
    super do |resource|
      if resource.errors.full_messages.empty?
        begin
          ::Hosts::ResetPasswordMailer.send_to(resource.email).deliver_now
        rescue StandardError => ex
          puts ex
        end
      end
    end
    sign_out(current_host) if current_host
  end

  def update_password_complete; end
  def reset_password_complete; end

  protected

  def after_resetting_password_path_for(resource)
    host_update_password_complete_path
  end

  # The path used after sending reset password instructions
  def after_sending_reset_password_instructions_path_for(resource_name)
    host_reset_password_complete_path
  end

  private

  def find_host
    @host = Host.find_by(email: params[:host][:email])
  end

  def render_error(message, host = nil)
    set_flash_message(:alert, message)
    host.send_reset_password_instructions if host
    redirect_to new_host_password_path
  end
end
