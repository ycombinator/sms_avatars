class TwilioIncomingSmsController < ApplicationController

  def create
    @app = App.find(params[:id])

    # Figure out intended recipient

    # Check if intended recipient is added as a test_number

    # If found, figure out active avatar

    # If found, substitute original intended recipient with active avatar's number

    # Send request to app's incoming SMS URI

    # Substitute response sender with original intended recipient

    # Send response to Twilio

  end

end
