class AddAttachmentFileToReadings < ActiveRecord::Migration
  def self.up
    change_table :readings do |t|
      t.attachment :file
    end
  end

  def self.down
    drop_attached_file :readings, :file
  end
end
