require 'test_helper'

class FollowUpTest < ActiveSupport::TestCase
	
  test "follow-up task can't be blank" do 
    follow_up = FollowUp.new(task: "")
    assert follow_up.invalid?
    assert follow_up.errors[:task].any?
  end 

  test "assigned_user_id can't be blank" do 
    follow_up = FollowUp.new(assigned_user_id: "")
    assert follow_up.invalid?
    assert follow_up.errors[:task].any?
  end

end
