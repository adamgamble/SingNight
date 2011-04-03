# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110402162635) do

  create_table "books", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", :force => true do |t|
    t.integer  "section_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "image_number"
  end

  create_table "sections", :force => true do |t|
    t.integer  "song_id"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "section_type"
  end

  create_table "songs", :force => true do |t|
    t.integer  "book_id"
    t.integer  "song_number"
    t.text     "title"
    t.string   "beat_pattern"
    t.string   "key"
    t.string   "starting_pitch"
    t.string   "starting_pitch_direction"
    t.string   "time"
    t.integer  "starting_beat"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
