require 'test_helper'

class VitalsControllerTest < ActionController::TestCase
 require 'test_helper'

  test "should not be able to do anything if not logged in" do
    session[:client_id] = clients(:one).id
    get :index, client_id: vitals(:one).id
    assert_redirected_to root_path
  end

  test "should get index" do
    login_as(:one)
    session[:client_id] = clients(:one).id
  	get :index, client_id: vitals(:one).id
  	assert_response :success
  end

  test "should create a new vital" do
    login_as(:one)
    client = clients(:one)

  	assert_difference('Vital.count') do
  	  post :create, { client_id: client.id, vital: { weight: "100", height: "5", systolic: "120", diastolic: "80", beats: "40", beats_location: "right", beats_condition: "Normal", blood_sugar: "10", bs_condition: "normal", breaths: "20", breaths_condition: "Sitting", breaths_description: "Normal", temperature: "30" } }
  	end
    
    vital = assigns(:vital)
    assert vital.client
    assert_equal client.id, vital.client.id
  	assert_redirected_to new_client_vital_path(vital.client)
  end


  # test "should belong to specific client"
  #   get :new
    

  # test "edit doesn't work" do
  # 	get :edit, id: vitals(:one).id
  # 	assert_response :false
  # end

  # test "update doesn't work" do
  # 	vital = vitals(:one)
	 #  patch :update, id: vital.id, vital: { title: vital.title, description: vital.description, 
  # 	  	client_id: vital.client_id, 
  # 	  	importance: vital.importance
  # 	 }
  # 	assert_redirected_to vitals_path
  # end


  # test "destroy doesn't work" do
  # 	assert_difference('vital.count', -1) do
  # 		delete :destroy, id: vitals(:one)
  # 	end
  # 	assert_redirected_to vitals_path
  # end
end

