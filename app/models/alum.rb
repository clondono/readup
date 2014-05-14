class Alum < User

  has_many :interests, foreign_key: "user_id", dependent: :destroy
  has_many :tags, through: :interests

	#favorites
end
