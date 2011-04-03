class ParseSongDirectory
  def initialize options={}
    @directory = options[:directory]
    @book      = options[:book]
    @songs     = []

    raise "You must provide a book" unless @book.is_a?(Book)
    raise "You must provide a directory" unless File.directory? @directory
  end

  def run
    Dir.glob("#{@directory}/*").each do |song_dir|
      song = @book.songs.find_by_song_number song_dir.last(3)
      images = Dir.glob("#{song_dir}/*")
      images.reject! {|image| image =~ /TITLE/}
      song_hash = Hash.new
      song_hash["song"] = song
      song_hash["sections"] = Hash.new
      images.each do |image|
        raw_image_name = image
        small_image_name = image.split("-").last
        if image =~ /CHORUS/
          image_number = small_image_name.split(".")[-2]
          song_hash["sections"]["chorus"] = Hash.new unless song_hash["sections"]["chorus"].is_a?(Hash)
          song_hash["sections"]["chorus"]["images"] = image_number.to_i
          song_hash["sections"]["chorus"]["image_files"] = Hash.new unless song_hash["sections"]["chorus"]["image_files"].is_a?(Hash)
          song_hash["sections"]["chorus"]["image_files"][image_number] = File.open(image)
        elsif image =~ /CODA/
          image_number = small_image_name.split(".")[-2]
          song_hash["sections"]["coda"] = Hash.new unless song_hash["sections"]["coda"].is_a?(Hash)
          song_hash["sections"]["coda"]["images"] = image_number.to_i
          song_hash["sections"]["coda"]["image_files"] = Hash.new unless song_hash["sections"]["coda"]["image_files"].is_a?(Hash)
          song_hash["sections"]["coda"]["image_files"][image_number] = File.open(image)
        else
          verse_number = "verse_#{small_image_name.first(2).last(1)}"
          image_number = small_image_name.split(".")[-2]

          file = File.open image

          section = song.sections.find_or_create_by_section_type_and_number("verse",small_image_name.first(2).last(1))
          section_image = section.images.find_or_create_by_image_number image_number
          section_image.image = file
          section_image.save
=begin
          song_hash["sections"][verse_number] = Hash.new unless song_hash["sections"][verse_number].is_a?(Hash)
          song_hash["sections"][verse_number]["images"] = image_number.to_i
          song_hash["sections"][verse_number]["image_files"] = Hash.new unless song_hash["sections"][verse_number]["image_files"].is_a?(Hash)
          song_hash["sections"][verse_number]["image_files"][image_number] = file
=end
        end
      end
      puts song_hash
      puts "***************"
    end
  end
end
