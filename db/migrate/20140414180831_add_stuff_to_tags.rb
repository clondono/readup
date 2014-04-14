class AddStuffToTags < ActiveRecord::Migration
  def change
    add_column :tags, :title, :string
    add_column :tags, :description, :text
  end
end
