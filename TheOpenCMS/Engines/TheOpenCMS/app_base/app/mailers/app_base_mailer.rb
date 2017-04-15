class AppBaseMailer < ActionMailer::Base
  layout 'app_base_mailer'

  def self.smtp?
    ['smtp', 'letter_opener'].include?(::Settings.app.mailer.service)
  end

  if smtp?
    _mailer = ::Settings.app.mailer

    default bcc:  _mailer.admin_email
    default from: _mailer.smtp.default.user_name

    def self.smtp_settings
      ::Settings.app.mailer.smtp.default.to_h
    end
  end
end
