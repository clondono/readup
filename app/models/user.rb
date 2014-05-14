class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


#return the name of a user by concatenating the first name and the last name if they both exist
#return email otherwise
def name
  if self.first_name? && self.last_name?
    self.first_name + " " + self.last_name
  else
    self.email
  end
end


end
