# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!


# ActionMailer::Base.smtp_settings = {
#   :user_name => 'apikey', # This is the string literal 'apikey', NOT the ID of your API key
#   :password => '<SENDGRID_API_KEY>', # This is the secret sendgrid API key which was issued during API key creation
#   :domain => "gmail.com" #'yourdomain.com',
#   :address => 'smtp.sendgrid.net',
#   :port => 587,
#   :authentication => :plain,
#   :enable_starttls_auto => true
# }
#
# config.action_mailer.delivery_method = :smtp
# config.action_mailer.smtp_settings = {
#   address:              'smtp.gmail.com',
#   port:                 587,
#   domain:               'example.com',
#   user_name:            '<username>',
#   password:             '<password>',
#   authentication:       'plain',
#   enable_starttls_auto: true,
#   open_timeout:         5,
#   read_timeout:         5 }

#ActionMailer::Base.delivery_method = :sendmail
##:smtp
#ActionMailer::Base.smtp_settings = {
#  address:              'smtp.gmail.com',
#  port:                 587,
#  domain:               'example.com',
#  user_name:            '<username>',
#  password:             '<password>',
#  authentication:       'plain',
#  enable_starttls_auto: true,
#  open_timeout:         5,
#  read_timeout:         5 }
