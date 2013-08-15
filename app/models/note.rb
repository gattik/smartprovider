class Note < ActiveRecord::Base
	belongs_to :client
	belongs_to :user

	validates :title, :description, presence: true
end
