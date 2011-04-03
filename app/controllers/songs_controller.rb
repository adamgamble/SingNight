class SongsController < ApplicationController
  before_filter :load_all_songs, :only => [:index]
  before_filter :load_song, :only => [:show]
  private
  def load_all_songs
    @songs = Song.all
  end

  def load_song
    @song = Song.find params[:id]
  end
  public

  def index
  end

  def show
    frame = get_frame
    if params["show_specific_song"]
      section = @song.sections.find_by_section_type_and_number(params["section_type"],params["section_number"])
      image = section.images.find_by_image_number(params["image_number"])
      frame.show_image image.image
    else
      frame.show_image @song.sections.first.images.first.image
    end
  end
end
