class AddPhotoToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :photo_file_name, :string #Original Filename
    add_column :products, :photo_content_type, :string #Mime type
    add_column :products, :photo_file_size, :integer #File size in bytes
    add_column :products, :photo_updated_at, :datetime #File size in bytes
  end

  def self.down
    remove_column :products, :photo_file_name
    remove_column :products, :photo_content_type
    remove_column :products, :photo_file_size
    remove_column :products, :photo_updated_at
  end
end
