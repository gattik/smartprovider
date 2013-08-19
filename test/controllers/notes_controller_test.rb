require 'test_helper'

class NotesControllerTest < ActionController::TestCase
  
  test "should get index" do
    login_as(:one)
    session[:client_id] = clients(:one).id
  	get :index
  	assert_response :success
  end

  test "should get new" do
    login_as(:one)
  	get :new
  	assert_response :success
  end

  test "should get create" do
    login_as(:one)
    session[:client_id] = clients(:one).id
  	assert_difference('Note.count') do
  	  post :create, note: { title: "foo", description: "bar" }
  	end
    
    note = assigns(:note)
    # assert note.client
  	assert_redirected_to client_path(note.client)
  end

  test "should get show" do
    login_as(:one)
  	get :show, id: notes(:one).id

  	assert_response :success
  end

  # test "should belong to specific client"
  #   get :new
    

  # test "edit doesn't work" do
  # 	get :edit, id: notes(:one).id
  # 	assert_response :false
  # end

  # test "update doesn't work" do
  # 	note = notes(:one)
	 #  patch :update, id: note.id, note: { title: note.title, description: note.description, 
  # 	  	client_id: note.client_id, 
  # 	  	importance: note.importance
  # 	 }
  # 	assert_redirected_to notes_path
  # end


  # test "destroy doesn't work" do
  # 	assert_difference('Note.count', -1) do
  # 		delete :destroy, id: notes(:one)
  # 	end
  # 	assert_redirected_to notes_path
  # end
end
