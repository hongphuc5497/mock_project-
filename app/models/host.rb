class Host < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :registerable, :validatable, :confirmable
  def password_required?
    super if confirmed?
  end

  def password_match?
    self.errors[:password] << I18n.t('errors.messages.blank') if password.blank?
    self.errors[:password_confirmation] << I18n.t('errors.messages.blank') if password_confirmation.blank?
    self.errors[:password_confirmation] << I18n.translate("errors.messages.confirmation", attribute: "password") if password != password_confirmation
    password == password_confirmation && !password.blank? && !password_confirmation.blank?
  end

  # new function to set the password without knowing the current
  # password used in our confirmation controller.
  def attempt_set_password(params)
    p = {}
    p[:password] = params[:password]
    p[:password_confirmation] = params[:password_confirmation]
    update_attributes(p)
  end

  # new function to return whether a password has been set
  def has_no_password?
    self.encrypted_password.blank?
  end

  def only_if_unconfirmed
    pending_any_confirmation {yield}
  end 
end
