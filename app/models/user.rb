class User < ActiveRecord::Base
	has_many :clients
	has_many :notes
  has_many :follow_ups

	has_secure_password validations: true

	validates :first_name, :last_name, :designation, :phone, :email, :username, presence: true

  validates_uniqueness_of :email, :username

  # before_save { self.email = email.downcase }
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i  
  # validates :email, :first_name, :last_name, presence: true
  # validates :email, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
  # validates :password, length: { minimum: 6 }
  # has_secure_password

end
