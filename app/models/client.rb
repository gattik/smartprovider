class Client < ActiveRecord::Base
	has_many :cases
	has_many :users, through: :cases

	has_many :notes
	has_many :vitals

	validates :first_name, :last_name, :date_of_birth, :gender, :hcn, :diagnosis, :street, :city, :province, presence: true
  validates_uniqueness_of :hcn
  validates :hcn, format: { with: /[0-9]{10}+[A-Z]{2}/ }

  mount_uploader :image, ImageUploader

  scoped_search on: [:first_name, :last_name]

  acts_as_gmappable

  def gmaps4rails_address
    "#{self.street}, #{self.city}, #{self.province}"
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def gmaps4rails_infowindow
    "#{self.full_name}"
  end
end
