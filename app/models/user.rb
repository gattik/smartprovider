class User < ActiveRecord::Base
	has_many :clients
	has_many :notes

	has_secure_password validations: false
end
