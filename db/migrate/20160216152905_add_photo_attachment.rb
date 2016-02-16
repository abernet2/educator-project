class AddPhotoAttachment < ActiveRecord::Migration
  def change
    remove_column :users, :photo_url
    add_attachment :users, :photo
  end
end
