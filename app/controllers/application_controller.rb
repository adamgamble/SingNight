class ApplicationController < ActionController::Base
  protect_from_forgery
  load 'lib/example.rb'

  def get_frame
    frame = nil
    JFrame.getFrames.each do |fr|
      frame = fr
    end
    frame = Example.new if frame.nil?
    frame
  end
end
