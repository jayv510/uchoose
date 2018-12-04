class CallDurationsController < ApplicationController

  def create
    participant_SID = params[:participantSID]
    room_SID = params[:roomSID]
    mentor = Mentor.find(params[:mentorID])

    # puts "The mentor's rate is #{mentor.rate} USD per 30 min"
    # puts "The mentor's rate is #{(mentor.rate).to_f / 30} USD per 1 min"

    client = Twilio::REST::Client.new(ENV['TWILIO_API_KEY'], ENV['TWILIO_API_SECRET'])

    participant = client.video.rooms(room_SID).participants(participant_SID)

    call_seconds = participant.fetch.duration
    @call_duration = Time.at(call_seconds).utc.strftime("%H:%M:%S")

    @total_cost = (call_seconds.to_f / 60) * (mentor.rate.to_f / 30)

    # puts "The call was #{call_length} seconds long"
    # puts "The call was #{(call_length).to_f / 60} minutes long"

    puts "Call duration: #{@call_duration}"
    # Time.at(t).utc.strftime("%H:%M:%S")

    puts "The total cost was #{@total_cost.round(2)} USD"

    respond_to do |format|
      format.js
    end
  end

end

