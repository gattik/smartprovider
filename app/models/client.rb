class Client < ActiveRecord::Base
	has_many :users
	has_many :notes
	has_many :vitals

	validates :first_name, :last_name, :date_of_birth, :gender, :hcn, :diagnosis, :address, presence: true
  validates_uniqueness_of :hcn

end
