require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get index" do
  	get :index
  	assert_response :success
  end

  test "should get new" do
  	get :new
  	assert_response :success
  end

  test "should get create" do
  	attributes = valid_user_attributes
  	assert_difference('User.count') do
  	  post :create, user: attributes
  	end
  	assert_redirected_to users_path
  end

  test "should get show" do
  	get :show, id: users(:one).id

  	assert_response :success
  end

  test "should get edit" do
  	get :edit, id: users(:one).id
  	assert_response :success
  end

  test "should update user" do
  	user = users(:two)
    attributes = valid_user_attributes

	  patch :update, id: user.id, user: attributes
  	assert_redirected_to users_path
  end


  test "should get destroy" do
  	assert_difference('User.count', -1) do
  		delete :destroy, id: users(:one)
  	end
  	assert_redirected_to users_path
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
end
