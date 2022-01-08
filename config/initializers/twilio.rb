require 'pry-byebug'

Twilio.configure do |config|
  binding.pry
  config.account_sid = Rails.application.credentials.twilio[:account_sid]
  config.auth_token = Rails.application.credentials.twilio[:auth_token]
end
