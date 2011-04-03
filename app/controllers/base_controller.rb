class BaseController < ApplicationController
  load 'lib/example.rb'

  def get_frame
    frame = nil
    JFrame.getFrames.each do |fr|
      frame = fr
    end
    frame = Example.new if frame.nil?
    frame
  end

  def index
    get_frame
  end
end
