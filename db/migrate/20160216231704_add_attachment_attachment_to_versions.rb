class AddAttachmentAttachmentToVersions < ActiveRecord::Migration
  def self.up
    change_table :versions do |t|
      t.attachment :attachment
    end
  end

  def self.down
    remove_attachment :versions, :attachment
  end
end
