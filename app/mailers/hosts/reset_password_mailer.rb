module Hosts
  class ResetPasswordMailer < ApplicationMailer
    default from: EasySettings.email.mail_address_info

    def send_to(email)
      begin
        mail(to: email, subject: 'Password Update Notice')
      rescue StandardError => se
        raise StandardError, se
      end
    end
  end
end
