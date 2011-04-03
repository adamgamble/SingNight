class AddImageNumberToImage < ActiveRecord::Migration
  def self.up
    add_column :images, :image_number, :integer
  end

  def self.down
  end
end
