ActionMailer::Base.smtp_settings = {
    port:              587,
    address:           'smtp.mailgun.org',
    user_name:         ENV['MAILGUN_SMTP_LOGIN'],
    password:          ENV['MAILGUN_SMTP_PASSWORD'],
    domain:            'sandbox08f0b5c4150e402ea2c5833f63028008.mailgun.org',
    authentication:    :plain,
    content_type:      'text/html',
    enable_starttls_auto: true
  }
  ActionMailer::Base.delivery_method = :smtp
  # Makes debugging *way* easier.
  ActionMailer::Base.raise_delivery_errors = true

  