class Admin < ActiveRecord::Base
	has_secure_password

	validates :admin_email,
			  :presence => {:message => 'Email can not be blank.'},
			  :uniqueness => {:message => 'The email address is already used.'},
			  email_format: {message: "Not a valid email format."}

	validates :username,
			  :presence => {:message => 'Username can not be blank.'},
			  :uniqueness => {:message => 'The username is already used.'}


	def self.check(username, password)
		admin = find_by_username(username)
		if admin && admin.authenticate(password)
			admin
		else
			nil
		end
	end

end
