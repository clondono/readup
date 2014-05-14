class Tag < ActiveRecord::Base
	has_many :taggables
 	has_many :readings, through: :taggables
  has_many :interests
end
