class Client < ActiveRecord::Base
	has_many :cases
	has_many :users, through: :cases

	has_many :notes
	has_many :vitals

	validates :first_name, :last_name, :date_of_birth, :gender, :hcn, :diagnosis, :street, :city, :provence, presence: true
  validates_uniqueness_of :hcn

  mount_uploader :image, ImageUploader

  acts_as_gmappable

  def gmaps4rails_address
    "#{self.street}, #{self.city}, #{self.provence}"
  end

end
