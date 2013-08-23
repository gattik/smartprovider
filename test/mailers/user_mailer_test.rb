require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  tests UserMailer
    
  test "user confirmation has the correct format" do
    # Send the email, then test that it got queued
    user = users(:one)

    email = UserMailer.welcome_email(user).deliver
    
    assert !ActionMailer::Base.deliveries.empty?
 
    # Test the body of the sent email contains what we expect it to
    assert_equal ['ronald@smartprovider.ca'], email.from
    assert_equal [user.email], email.to
    assert_equal 'Welcome to SmartProvider!', email.subject
  end
end
