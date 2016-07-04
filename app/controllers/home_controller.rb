class HomeController < ApplicationController

  def index
    require 'net/http'
    @sample_template  = File.read('sample_template.html')
    @marking_instructions_text = File.read('sample_marking_instructions.html')

    if (!(session.has_key?(:lti_session_key)) || session[:lti_session_key].length <= 0)
        session[:lti_session_key] = generate_random_key(8)
    end

    #@keyset = BasicLtiKey.find_by session_key: session[:lti_session_key], :used false
    @keyset = BasicLtiKey.find_by(session_key: session[:lti_session_key], used: false)
    if (@keyset == nil)
        @keyset = BasicLtiKey.new
        begin
        	@keyset.secret = generate_random_key(6)
        	@keyset.oauth_consumer_key = generate_random_key(12)
        	@keyset.name = "Name Field"
        	@keyset.context_id = generate_random_key(12)
        	@keyset.url_segment = generate_random_key(32)
            @keyset.session_key = session[:lti_session_key]
        end while !@keyset.valid?
        @keyset.save
    end
  end

  def generate_random_key(length=32)
		o = [('a'..'z'), (0..9)].map { |i| i.to_a }.flatten
		(0...length).map { o[rand(o.length)] }.join
	end
end
