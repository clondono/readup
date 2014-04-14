class CreateTaggables < ActiveRecord::Migration
  def change
    create_table :taggables do |t|

      t.timestamps
    end
  end
end
