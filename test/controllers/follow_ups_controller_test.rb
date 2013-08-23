require 'test_helper'

class FollowUpsControllerTest < ActionController::TestCase

  test "should create new follow_up" do
    login_as(:one)
    user = users(:two)
    client = clients(:one)
    note = notes(:one)

    assert_difference('FollowUp.count') do
      post :create, { user_id: user.id, client_id: client.id, note_id: note.id, follow_up: { task: "Some valid task"} }
    end

    follow_up = assigns(:follow_up)
    assert follow_up.note
    assert_equal user, follow_up.user
    assert_redirected_to client_path(client)
  end
end
