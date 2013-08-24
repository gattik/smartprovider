require 'test_helper'

class VitalTest < ActiveSupport::TestCase

	test "should not allow vitals to save if all fields are empty" do
		vital = Vital.new(weight: "", 
			height: "",
			systolic: "",
			diastolic: "",
			beats: "",
			blood_sugar: "",
			breaths: "",
			temperature: "")

		assert vital.invalid?
		assert vital.errors.any?
	end

end
