class AddLinkedInToUser < ActiveRecord::Migration
  def change
    add_column :users, :linkedIn, :string
  end
end
