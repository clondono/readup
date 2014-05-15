class Reading < ActiveRecord::Base

	belongs_to :student, foreign_key: "uploader_id"
    has_many :comments

	#Include PDF
    has_attached_file :file
    validates_attachment :file, content_type: { content_type: "application/pdf" }

    has_many :taggables, dependent: :destroy
    has_many :tags, through: :taggables


    accepts_nested_attributes_for :taggables, :reject_if => lambda { |a| a[:tag_id].blank? }, :allow_destroy => true
    accepts_nested_attributes_for :tags, :reject_if => lambda { |a| a[:title].blank? }, :allow_destroy => true

    #this returns all projects that have the tags whose
    #ids is specified in the params array
    def self.search(tag_ids)
        Reading.joins(:tags).where(:tags => {:id => tag_ids})
    end
    def access_level(user_id)
        if user_id == self.student.id
            return "uploader"
        else 
            return "none"
        end
    end

end
