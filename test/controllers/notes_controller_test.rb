require 'test_helper'

class NotesControllerTest < ActionController::TestCase
  test "should get index" do
  	get :index
  	assert_response :success
  end

  test "should get new" do
  	get :new
  	assert_response :success
  end

  test "should get create" do
  	note = notes(:one)
  	assert_difference('Note.count') do
  	  post :create, note: { title: note.title, description: note.description, 
  	  	client_id: note.client_id, 
  	  	importance: note.importance
  	  }
  	end
  	assert_redirected_to notes_path
  end

  test "should get show" do
  	get :show, id: notes(:one).id

  	assert_response :success
  end

  


  # test "should get edit" do
  # 	get :edit, id: notes(:one).id
  # 	assert_response :success
  # end

  # test "should update note" do
  # 	note = notes(:one)
	 #  patch :update, id: note.id, note: { title: note.title, description: note.description, 
  # 	  	client_id: note.client_id, 
  # 	  	importance: note.importance
  # 	 }
  # 	assert_redirected_to notes_path
  # end


  # test "should get destroy" do
  # 	assert_difference('Note.count', -1) do
  # 		delete :destroy, id: notes(:one)
  # 	end
  # 	assert_redirected_to notes_path
  # end
end
