class User < ActiveRecord::Base
	has_many :cases
  has_many :clients, through: :cases
  
	has_many :notes
  has_many :follow_ups

	has_secure_password validations: true

	validates :first_name, :last_name, :designation, :phone, :email, :username, presence: true


  validates_uniqueness_of :email
  validates :email, format: { with: /(\w[-._\w]*\w@\w[-._\w]*\w\.\w{2,3})/ }
  validates_uniqueness_of :username

end
