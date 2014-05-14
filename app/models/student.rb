class Student <User
	has_many :readings, foreign_key: "uploader_id"
	#has alot of summaries
end
