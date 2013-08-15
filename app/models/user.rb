class User < ActiveRecord::Base
	has_many :clients
	has_many :notes
end
