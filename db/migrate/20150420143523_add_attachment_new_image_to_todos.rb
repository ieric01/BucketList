class AddAttachmentNewImageToTodos < ActiveRecord::Migration
  def self.up
    change_table :todos do |t|
      t.attachment :new_image
    end
  end

  def self.down
    remove_attachment :todos, :new_image
  end
end
