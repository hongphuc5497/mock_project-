# frozen_string_literal: true

class Hosts::ConfirmationsController < Devise::ConfirmationsController
  def update
    with_unconfirmed_confirmable do
      if @confirmable.has_no_password?
        set_password_and_confirm(@confirmable)
      else
        if @confirmable.confirmed?
          @confirmable.errors.add(:email, :password_already_set)
        else
          set_password_and_confirm(@confirmable)
        end
      end
    end

    if !@confirmable.errors.empty?
      self.resource = @confirmable
      render :new #Change this if you don't have the views on default path
    end
  end

  def set_password_and_confirm(confirmable)
    confirmable.attempt_set_password(params[:host])
    if confirmable.valid? and confirmable.password_match?
      do_confirm
    else
      do_show
      confirmable.errors.clear #so that we wont render :new
    end
  end

  # GET /resource/confirmation?confirmation_token=abcdef
  def show
    with_unconfirmed_confirmable do
      unless @confirmable.confirmed?
        do_show
      else
        do_confirm if @confirmable.password_match?
      end
    end
    unless @confirmable.errors.empty?
      self.resource = @confirmable
      render :new #Change this if you don't have the views on default path
    end
  end

  protected

  def with_unconfirmed_confirmable
    params[:confirmation_token] ||= params[:host][:confirmation_token]
    @confirmable = Host.find_or_initialize_with_error_by(:confirmation_token, params[:confirmation_token])
    if !@confirmable.new_record?
      @confirmable.only_if_unconfirmed {yield}
    end
  end

  def do_show
    @confirmation_token = params[:confirmation_token]
    @requires_password = true
    self.resource = @confirmable
    render :show #Change this if you don't have the views on default path
  end

  def do_confirm
    @confirmable.confirm
    set_flash_message :notice, :confirmed
    redirect_to host_change_password_success_path
  end

  def change_password_success; end
end
