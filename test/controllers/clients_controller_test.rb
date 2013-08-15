require 'test_helper'

class ClientsControllerTest < ActionController::TestCase
	
  test "should get index" do
  	get :index
  	assert_response :success
  end

  test "should get new" do
  	get :new
  	assert_response :success
  end

  test "should get create" do
  	client = clients(:one)
  	assert_difference('Client.count') do
  	  post :create, client: { first_name: client.first_name, last_name: client.last_name, 
  	  	hcn: client.hcn, 
  	  	physician: client.physician, 
  	  	physician_phone: client.physician_phone,
  	  	diagnosis: client.diagnosis, 
  	  	advanced_directives: client.advanced_directives,
  	  	address: client.address, 
  	  	contact_name: client.contact_name, 
  	  	contact_phone: client.contact_phone, 
  	  	contact_relationship: client.contact_relationship }
  	end
  	assert_redirected_to clients_path
  end

  test "should get show" do
  	get :show, id: clients(:one).id

  	assert_response :success
  end

  test "should get edit" do
  	get :edit, id: clients(:one).id
  	assert_response :success
  end

  test "should update client" do
  	client = clients(:one)
	  patch :update, id: client.id, client: { first_name: client.first_name, last_name: client.last_name, 
	  	hcn: client.hcn, 
	  	physician: client.physician, 
	  	physician_phone: client.physician_phone,
	  	diagnosis: client.diagnosis, 
	  	advanced_directives: client.advanced_directives,
	  	address: client.address, 
	  	contact_name: client.contact_name, 
	  	contact_phone: client.contact_phone, 
	  	contact_relationship: client.contact_relationship
	  }
  	assert_redirected_to clients_path
  end


  test "should get destroy" do
  	assert_difference('Client.count', -1) do
  		delete :destroy, id: clients(:one)
  	end
  	assert_redirected_to clients_path
  end

end
