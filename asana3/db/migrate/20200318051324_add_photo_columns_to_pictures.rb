class AddPhotoColumnsToPictures < ActiveRecord::Migration
  def up
    add_attachment :pictures, :photo
  end

  def down
    remove_attachment :pictures, :photo
  end
end
