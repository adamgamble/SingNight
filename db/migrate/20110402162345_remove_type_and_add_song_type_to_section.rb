class RemoveTypeAndAddSongTypeToSection < ActiveRecord::Migration
  def self.up
    remove_column :sections, :type
    add_column :sections, :song_type, :string
  end

  def self.down
  end
end
