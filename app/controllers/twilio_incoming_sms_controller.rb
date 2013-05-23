require 'curb'
require 'addressable/uri'
require 'xmlsimple'

class TwilioIncomingSmsController < ApplicationController

  def create
    app = App.find(params[:app_id])

    # Figure out sender
    sender = params[:From]

    # Check if intended recipient is added as a test_number
    if (sender)
      
      test_number = TestNumber.where(number: sender, app_id: app.id).first

      # If found, figure out active avatar
      if (test_number)
        
        active_avatar = test_number.active_avatar

        # If found, substitute original intended recipient with active avatar's number
        if (active_avatar)
          
          # Send request to app's incoming SMS URI
          request_params = params.clone
          request_params.delete(:app_id)
          request_params.delete(:action)
          request_params.delete(:controller)
          request_params[:From] = active_avatar.number

          uri = Addressable::URI.new
          uri.query_values = request_params

          puts 'Making request to ' + app.incomingSmsUri + ':'
          puts request_params

          begin
            Curl::Easy.http_post(app.incomingSmsUri, uri.query) { |c|

              c.on_complete { |easy| 

                puts easy.response_code
                if ((easy.response_code >= 200) && (easy.response_code < 400))

                  puts 'Received response from upstream app: ' + easy.body_str

                  # Add message about avatar
                  begin
                    twiml = XmlSimple.xml_in(easy.body_str)
                    puts twiml
                    twiml['Sms'].unshift('[SMS Avatars] You are pretending to be ' + active_avatar.name)
                    puts twiml
                    substituted_body = XmlSimple.xml_out(twiml, :RootName => 'Response')
                  rescue Exception => e
                    puts 'XML parsing exception: ' + e.message
                    render :status => 500, :text => 'Error parsing response from ' + app.incomingSmsUri
                  end

                  puts 'About to respond with: ' + substituted_body

                  # Send response to Twilio
                  render :status => easy.response_code, :content_type => easy.content_type, :text => substituted_body
                  
                else
                  render :status => easy.response_code, :content_type => easy.content_type, :text => easy.body_str
                end

              } # c.on_complete
              
            } # Curl::Easy.http_post
            
          rescue Exception => e
            puts 'Rescued: ' + e.message
            render :status => 502, :text => 'SMS Avatars could not communicate with ' + app.incomingSmsUri
          end

        end
        
      end
      
    end
    
  end

end
