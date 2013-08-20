class Client < ActiveRecord::Base
	has_many :users
	has_many :notes
	has_many :vitals
end
