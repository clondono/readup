class Summary < ActiveRecord::Base
	validates :title, presence: true
	validates :content, presence: true
	belongs_to :reading
	belongs_to :user, foreign_key: "creator_id"

	def creator
		User.find_by(:id=>user_id)
	end

	# A user can delete or edit an existing Update only if he originally created it
	def can_edit?(current_user_id)
		if User.find(current_user_id) == creator
			return true
		else
			return false
		end
	end


end
