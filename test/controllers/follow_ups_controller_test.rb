require 'test_helper'

class FollowUpsControllerTest < ActionController::TestCase

  test "should not be able to do anything if not logged in" do
    get :index
    assert_redirected_to login_path

    get :new
    assert_redirected_to login_path
  end

  test "should get new form for follow_up" do 
    login_as(:one)
    get :new
    assert_response :success
  end

  test "should create new follow_up" do
    login_as(:one)
    note = notes(:one)
    expected_user = users(:one)

    assert_difference('FollowUp.count') do
      post :create, { note_id: note.id, follow_up: { task: "Some valid task", assigned_user_id: expected_user.id } }
    end

    follow_up = assigns(:follow_up)
    assert follow_up.note
    assert_equal expected_user.id, follow_up.assigned_user_id
    assert_equal note.id, follow_up.note.id
    assert_redirected_to client_path(follow_up.note.client_id)
  end

  test "should update" do
    login_as(:one)
    note = notes(:one)
    post :create, { note_id: note.id, follow_up: { task: "Some valid task", assigned_user_id: 1 } }

    follow_up = assigns(:follow_up)

    patch :update, id: follow_up.id, follow_up: { completed: true }

    assert_redirected_to client_path(follow_up.note.client_id)
  end
end
