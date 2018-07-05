class MyMailer < Devise::Mailer
    helper :application
    include Devise::Controllers::UrlHelpers
    default template_path: 'devise/mailer'
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
      address: "smtp.gmail.com",
      port: 587,
      domain: "https://leinberger-blocmarks.herokuapp.com",
      authentication: "plain",
      enable_starttls_auto: true,
      user_name: ENV['CONFIRMABLE_EMAIL'],
      password: ENV['CONFIRMABLE_PASSWORD']
    }
end