class ChangeColumnInTaggables < ActiveRecord::Migration
  def up
  	rename_column :taggables, :readings_id, :reading_id
  end

  def down
  	rename_column :taggables, :reading_id, :readings_id
  end
end
