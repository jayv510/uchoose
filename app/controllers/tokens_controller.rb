class TokensController < ApplicationController


  def create
    # Define User Identity
    if current_prospective != nil
      identity = current_prospective.first_name + " " + current_prospective.last_name
    elsif current_mentor != nil
      identity = current_mentor.first_name + " " + current_mentor.last_name
    end

    # Create Grant for Access Token
    grant = Twilio::JWT::AccessToken::ChatGrant.new
    grant.service_sid = ENV['TWILIO_CHAT_SERVICE_SID']

    # Create an Access Token
    token = Twilio::JWT::AccessToken.new(
      ENV['TWILIO_ACCOUNT_SID'],
      ENV['TWILIO_API_KEY'],
      ENV['TWILIO_API_SECRET'],
      [grant],
      identity: identity
    )

    # Generate the token and send to client
    render json: { identity: identity, token: token.to_jwt }
  end

  def delete
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']

    @client = Twilio::REST::Client.new(account_sid, auth_token)

    channel = @client.chat.services('ISbe316255daa64f228907d04a9bc3565f')
                          .channels('channel3')
                          .fetch

    @client.chat.services('ISbe316255daa64f228907d04a9bc3565f')
                .channels(channel.sid)
                .delete
  end

end

