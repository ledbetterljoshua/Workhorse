class AddAttachmentImageToJukeboxes < ActiveRecord::Migration
  def self.up
    change_table :jukeboxes do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :jukeboxes, :image
  end
end
