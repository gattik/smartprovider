class User < ActiveRecord::Base
	has_many :clients
	has_many :notes

	has_secure_password validations: true

	validates :first_name, :last_name, :designation, :phone, :email, presence: true
end
