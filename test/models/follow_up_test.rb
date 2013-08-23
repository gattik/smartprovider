require 'test_helper'

class FollowUpTest < ActiveSupport::TestCase
	
  test "follow-up task can't be blank" do 
    follow_up = FollowUp.new(task: "")
    assert follow_up.invalid?
    assert follow_up.errors[:task].any?
  end 

end
