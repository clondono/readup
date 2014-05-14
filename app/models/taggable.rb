class Taggable < ActiveRecord::Base
	belongs_to :reading
	belongs_to :tag
end
