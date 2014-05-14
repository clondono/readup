class Interest < ActiveRecord::Base

	belongs_to :alum, foreign_key: 'user_id'
	belongs_to :tag
end
