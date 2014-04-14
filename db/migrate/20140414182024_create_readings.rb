class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
      t.integer :uploader_id
      t.string :title
      t.string :author

      t.timestamps
    end
  end
end
