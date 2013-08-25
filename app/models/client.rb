class Client < ActiveRecord::Base
	has_many :cases
	has_many :users, through: :cases

	has_many :notes
	has_many :vitals

	validates :first_name, :last_name, :date_of_birth, :gender, :hcn, :diagnosis, :address, presence: true
  
  validates_uniqueness_of :hcn
  validates :hcn, format: { with: /[0-9]{10}+[A-Z]{2}/ }

  mount_uploader :image, ImageUploader

end
