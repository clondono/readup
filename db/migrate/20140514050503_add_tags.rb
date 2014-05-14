class AddTags < ActiveRecord::Migration
  def change
  	Tag.create(:title => "Health", :description => "this reading relates to health sector")
  	Tag.create(:title => "Technology", :description => "this reading relates to technology")
  	Tag.create(:title => "Social", :description => "this is a social reading")
  	Tag.create(:title => "Engineering", :description => "engineering reading")
  	Tag.create(:title => "Sports", :description => "this reading relates to sports")
  	Tag.create(:title => "Arts", :description => "this reading relates to arts")
  	Tag.create(:title => "Music", :description => "music related reading")
  	Tag.create(:title => "Economics", :description => "this reading relates to economics")
  	Tag.create(:title => "Charity", :description => "charity related reading")
  	Tag.create(:title => "Political Science", :description => "this reading relates to political science")
   	Tag.create(:title => "Artificial Intelligence", :description => "this reading relates to artificial Intelligence")
  	Tag.create(:title => "Graph Theory", :description => "this reading relates to graph theory")

  end
end
