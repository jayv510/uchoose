class CalldurationsController < ApplicationController

  def create
    participant_SID = params[:participantSID]
    room_SID = params[:roomSID]

    # room_SID = "RM37d98d66052037c1c5469f1e17dd4a22"

    client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])

    participant = client.video.rooms(room_SID).participants(participant_SID).fetch

    puts "The call lasted #{participant.duration} seconds"
  end

end
