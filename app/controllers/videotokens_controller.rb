class VideotokensController < ApplicationController
  def create
    # Define User Identity
    if current_prospective != nil
      identity = current_prospective.first_name
    elsif current_mentor != nil
      identity = current_mentor.first_name
    end

    # Create Video grant for our token
    video_grant = Twilio::JWT::AccessToken::VideoGrant.new
    video_grant.room = 'premium chat'

    # Create an Access Token
    token = Twilio::JWT::AccessToken.new(
      ENV['TWILIO_ACCOUNT_SID'],
      ENV['TWILIO_API_KEY'],
      ENV['TWILIO_API_SECRET'],
      [video_grant],
      identity: identity
    )

    # Generate the token and send to client
    render json: { identity: identity, token: token.to_jwt }
  end
end
