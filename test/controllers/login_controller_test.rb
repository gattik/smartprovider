require 'test_helper'

class LoginControllerTest < ActionController::TestCase

  # test "confirms user exists" do
  # 	login_as(users(:one))
  # 	get :confirm, id: 1
  # 	assert_response :success
  # end

  test "should get new_session" do
    get :new
    assert_response :success
  end

  test "should get logout" do
    get :logout
    assert_redirected_to login_path
  end

  test "create with invalid email and password renders errors" do
    post :create, user: {email: "foo", password: "bar"}
    assert flash[:error]
    assert_redirected_to login_path
  end

  test "create with valid email and password sets session id" do
    user = users(:one)
    post :create, user: { email: user.email, password_digest: user.password_digest }
    assert_equal session[:user_id], user.id
  end

end
