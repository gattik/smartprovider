class Vital < ActiveRecord::Base
	belongs_to :client

	validate :any_present?

	def any_present?
	  if weight.empty? && height.empty? && systolic.empty? && diastolic.empty? && beats.empty? && blood_sugar.empty? && breaths.empty? && temperature.empty?
	    errors.add :base, "All fields cannot be blank."
	  end
	end
end
