ActionMailer::Base.smtp_settings = {
    port:              587,
    address:           'smtp.mailgun.org',
    user_name:         ENV['MAILGUN_SMTP_LOGIN'],
    password:          ENV['MAILGUN_SMTP_PASSWORD'],
    domain:            'https://leinberger-blocmarks.herokuapp.com',
    authentication:    :plain,
    content_type:      'text/html',
    enable_starttls_auto: true
  }
  ActionMailer::Base.delivery_method = :smtp
  # Makes debugging *way* easier.
  ActionMailer::Base.raise_delivery_errors = true

