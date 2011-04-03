class CreateSongs < ActiveRecord::Migration
  def self.up
    create_table :songs do |t|
      t.integer :book_id
      t.integer :song_number
      t.text :title
      t.string :beat_pattern
      t.string :key
      t.string :starting_pitch
      t.string :starting_pitch_direction
      t.string :time
      t.integer :starting_beat

      t.timestamps
    end
  end

  def self.down
    drop_table :songs
  end
end
