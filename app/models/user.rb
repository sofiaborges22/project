class User < ApplicationRecord	
	has_many :problems
	has_secure_password

	validates :username, presence: true
	validates :email, presence: true, uniqueness: true

	before_create { generate_token(:auth_token) }

	after_initialize :set_default_role, :if => :new_record?



	#calls set_default_role after object is created in memory
	#only if the object user does not exist in the database
	def set_default_role
		unless self.role
			self.role = :user
		end
	end

	def send_password_reset
	  generate_token(:password_reset_token)
	  self.password_reset_sent_at = Time.zone.now
	  save!
	  UserMailer.password_reset(self).deliver
	end

	def generate_token(column)
	  begin
	    self[column] = SecureRandom.urlsafe_base64
	  end while User.exists?(column => self[column])
	end


end
