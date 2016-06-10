class HomeController < ApplicationController

  def index
    require 'net/http'
    @sample_template  = File.read('sample_template.html')
    @marking_instructions_text = File.read('sample_marking_instructions.html')
  end
end
