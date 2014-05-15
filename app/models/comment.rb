class Comment < ActiveRecord::Base
	belongs_to :reading
	belongs_to :user, foreign_key: "creator_id"
	validates :body, presence: true

	def creator
		return user
	end
end
