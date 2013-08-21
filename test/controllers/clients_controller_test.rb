require 'test_helper'

class ClientsControllerTest < ActionController::TestCase

  test "should not be able to do anything if not logged in" do
    get :index
    assert_redirected_to login_path

    get :new
    assert_redirected_to login_path

  end

  test "should show all clients" do
    login_as(:one)
  	get :index
  	assert_response :success
  end

  test "should show new client form" do
    login_as(:one)
  	get :new
  	assert_response :success
  end

  test "should create new client" do
    login_as(:one)
  	attributes = valid_client_attributes
  	assert_difference('Client.count') do
  	  post :create, client: attributes
  	end
  	assert_redirected_to clients_path
  end

  test "should show client" do
    login_as(:one)
  	get :show, id: clients(:one).id

  	assert_response :success
  end

  test "should edit client" do
    login_as(:one)
  	get :edit, id: clients(:one).id
  	assert_response :success
  end

  test "should update client" do
    login_as(:one)
    client = clients(:two)
    attributes = valid_client_attributes
	  patch :update, id: client.id, client: attributes
  	assert_redirected_to clients_path
  end


  test "should get destroy" do
    login_as(:one)
  	assert_difference('Client.count', -1) do
  		delete :destroy, id: clients(:one)
  	end
  	assert_redirected_to clients_path
  end

  def valid_client_attributes
    client = clients(:one)
    attributes = client.attributes.except("id", "physician", "physician_phone", "advanced_directives", "contact_phone", "contact_relationship")
    client.destroy!

    raise unless Client.new(attributes).valid?

    return attributes
  end

end
