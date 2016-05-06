class User < ActiveRecord::Base
	    before_save { self.email =  email.downcase }
	    has_many :blogs
	    validates :username, presence: true, 
	              uniqueness: { case_sensitive:  false},
	              length: {minimum: 2, maximum: 32}
        VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
        validates :email, format: {with: VALID_EMAIL_REGEX},
                  uniqueness: { case_sensitive:  false},
	              length: {maximum: 100}
	    has_secure_password

end
