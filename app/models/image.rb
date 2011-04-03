class Image < ActiveRecord::Base
  require 'paperclip'

  belongs_to :section
  has_attached_file :image
end
