require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get index" do
    login_as(:one)
  	get :index
  	assert_response :success
  end

  test "should get new" do
  	get :new
  	assert_response :success
  end

  test "should create a new user with valid attributes" do
  	attributes = valid_user_attributes
  	assert_difference('User.count') do
  	  post :create, user: attributes
  	end
  	assert_redirected_to login_path
  end

  test "should NOT create a new user with invalid attributes" do
    attributes = invalid_user_attributes
    assert_difference('User.count', 0) do
      post :create, user: attributes
    end
    assert_template :new
  end

  test "should not be able to get edit if user is not logged in" do
    get :edit, id: users(:one).id
    assert_redirected_to login_path
  end

  #tests for if user is logged in
    test "should get show if user is logged in" do
      login_as(:one)
    	get :show, id: users(:one).id

    	assert_response :success
    end

    test "should get edit if user is logged in" do
      login_as(:one)

    	get :edit, id: users(:one).id
    	assert_response :success
    end

    test "should update user if user is logged in" do
      login_as(:two)
      user = users(:two)
      attributes = valid_user_attributes
  	  patch :update, id: user.id, user: attributes
    	assert_redirected_to user_path(users(:two))
    end


    test "should get destroy only if the user is logged in" do
      login_as(:one)
    	assert_difference('User.count', -1) do
    		delete :destroy, id: users(:one)
    	end
    	assert_redirected_to new_user_path
    end

  def valid_user_attributes
    user = users(:one)
    attributes = user.attributes.except("id")
    attributes[:password] = "foo"
    attributes[:password_confirmation] = "foo"
    user.destroy!

    raise unless User.new(attributes).valid?

    return attributes
  end

  def invalid_user_attributes
    attributes = valid_user_attributes
    attributes[:first_name] = nil

    raise if User.new(attributes).valid?

    return attributes
  end
end
