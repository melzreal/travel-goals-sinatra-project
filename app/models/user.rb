class User < ActiveRecord::Base

   has_many   :holidays
   has_many   :countries, through: :holidays
   has_many   :cities, through: :holidays

   has_secure_password
   validates_uniqueness_of :username
   
    def slug
   	 username.downcase.gsub(" ","-")
  	end

	def self.find_by_slug(slug)
	  User.all.find{|user| user.slug == slug}
	end

end