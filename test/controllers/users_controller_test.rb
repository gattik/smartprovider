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
  	user = users(:one)
  	assert_difference('User.count') do
  	  post :create, user: { first_name: user.first_name, last_name: user.last_name, 
  	  	designation: user.designation, 
  	  	phone: user.phone, 
  	  	email: user.email,
  	  	password: user.password, 
  	  	password_confirmation: user.password_confirmation
  	  }
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
  	user = users(:one)
	  patch :update, id: user.id, user: { first_name: user.first_name, last_name: user.last_name, 
  	  	designation: user.designation, 
  	  	phone: user.phone, 
  	  	email: user.email,
  	  	password: user.password, 
  	  	password_confirmation: user.password_confirmation
  	 }
  	assert_redirected_to users_path
  end


  test "should get destroy" do
  	assert_difference('User.count', -1) do
  		delete :destroy, id: users(:one)
  	end
  	assert_redirected_to users_path
  end
end
