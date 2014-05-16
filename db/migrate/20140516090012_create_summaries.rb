class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.integer :reading_id

      t.timestamps
    end
  end
end
