class Note < ActiveRecord::Base
	belongs_to :client
	belongs_to :user
  has_many :follow_ups
	validates :title, :description, presence: true
end
