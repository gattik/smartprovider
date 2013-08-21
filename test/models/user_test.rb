require 'test_helper'

class UserTest < ActiveSupport::TestCase

   test "User first name can't be blank" do
    user = User.new(first_name: "")
    assert user.invalid?
    assert user.errors[:first_name].any?
  end

  test "User last_name can't be blank" do
    user = User.new(last_name: "")
    assert user.invalid?
    assert user.errors[:last_name].any?
  end

  test "User designation can't be blank" do
    user = User.new(designation: "")
    assert user.invalid?
    assert user.errors[:designation].any?
  end

  test "User phone can't be blank" do
    user = User.new(phone: "")
    assert user.invalid?
    assert user.errors[:phone].any?
  end

  test "User email can't be blank" do
    user = User.new(email: "")
    assert user.invalid?
    assert user.errors[:email].any?
  end

  test "User username can't be blank" do
    user = User.new(username: "")
    assert user.invalid?
    assert user.errors[:username].any?
  end

  test "User email should be unique " do 
    user = User.new(email: users(:one).email,
                first_name: "MyString",
                last_name: "MyString",
                designation: "MyString",
                phone: "MyString",
                password_digest: "gibberish!",
                username: "thisuser")
    assert user.invalid?
    assert user.errors[:email].any?
  end

  test "User username should be unique " do 
    user = User.new(username: users(:one).username,
                first_name: "MyString",
                last_name: "MyString",
                designation: "MyString",
                phone: "MyString",
                password_digest: "gibberish!",
                email: "validemail@example.com")
    assert user.invalid?
    assert user.errors[:username].any?
  end

end
