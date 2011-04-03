class RemoveSongTypeAndAddSectionTypeToSection < ActiveRecord::Migration
  def self.up
    remove_column :sections, :song_type
    add_column :sections, :section_type, :string
  end

  def self.down
  end
end
