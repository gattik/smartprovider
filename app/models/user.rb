class User < ActiveRecord::Base
	has_many :clients
end
