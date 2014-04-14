class AddStuffToInterest < ActiveRecord::Migration
  def change
    add_column :interests, :user_id, :integer
    add_column :interests, :tag_id, :integer
  end
end
