class TwilioClient
  # attr_reader :client

  # def initialize
  #   @client = Twilio::REST::Client.new account_sid, auth_token
  # end

  # def send_text(user, message)
  #   client.api.account.messages.create(
  #     to: user.phone,
  #     from: phone_number,
  #     body: message
  #   )
  # end

  # private

  #   def account_sid
  #     Rails.application.credentials.twilio[:account_sid]
  #   end

  #   def auth_token
  #     Rails.application.credentials.twilio[:auth_token]
  #   end

  #   def phone_number
  #     Rails.application.credentials.twilio[:phone_number]
  #   end
  attr_reader :message, :phone

  def initialize(message, phone)
    @message = message
    @phone = phone
  end

  def sms
    client = Twilio::REST::Client.new
    client.messages.create({
      from: Rails.application.credentials.twilio[:phone_number],
      to: phone,
      body: message
    })
  end
end
