class HomeController < ApplicationController

  def index
    require 'net/http'
    #Load default templates as instance variables so they can be accessed from the page.
    #These will not be modified in any way.
    @sample_template = File.read(Rails.configuration.x.default_template_file_path + 'sample_template.html')
    @marking_instructions_text = File.read(Rails.configuration.x.default_template_file_path + 'sample_marking_instructions.html')

    #Create a new session key if there is not an existing one
    if (!(session.has_key?(:lti_session_key)) || session[:lti_session_key].length <= 0)
        session[:lti_session_key] = generate_random_key(8)
    end

    #Find any existing unused keyset with the current session ID
    @keyset = BasicLtiKey.find_by(session_key: session[:lti_session_key], used: false)
    #If there is no unused keyset then create a new one
    if (@keyset == nil)
        @keyset = BasicLtiKey.new
        begin
            #Generate key values for key set
        	@keyset.secret = generate_random_key(6)
        	@keyset.oauth_consumer_key = generate_random_key(12)
        	@keyset.name = "Name Field"
        	@keyset.linkgen_id = generate_random_key(12)
        	@keyset.url_segment = generate_random_key(32)
          @keyset.session_key = session[:lti_session_key]
        end while !@keyset.valid?
        @keyset.save #Write the new keyset to the database
    end
  end

  #Generate a random (non-crypto-safe) string of given or default 32 length.
  #Made up of characters a-z and 0-9
  def generate_random_key(length=32)
		o = [('a'..'z'), (0..9)].map { |i| i.to_a }.flatten
		(0...length).map { o[rand(o.length)] }.join
	end
end
