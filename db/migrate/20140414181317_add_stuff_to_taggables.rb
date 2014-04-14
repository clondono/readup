class AddStuffToTaggables < ActiveRecord::Migration
  def change
    add_column :taggables, :reading_id, :integer
    add_column :taggables, :tag_id, :integer
  end
end
