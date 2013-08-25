require 'test_helper'

class ClientTest < ActiveSupport::TestCase

  test "client first_name cannot be blank" do
  	client = Client.new(first_name: "")
  	assert client.invalid?
    assert client.errors[:first_name].any?
  end

  test "client last_name can't be blank" do
  	client = Client.new(last_name: "")
  	assert client.invalid?
    assert client.errors[:last_name].any?
  end
	
	test "client Date of birth can't be blank" do
  	client = Client.new(date_of_birth: "")
  	assert client.invalid?
    assert client.errors[:date_of_birth].any?
	end

	test "client gender can't be blank" do
  	client = Client.new(gender: "")
  	assert client.invalid?
    assert client.errors[:gender].any?
	end


	test "client hcn can't be blank" do
  	client = Client.new(hcn: "")
  	assert client.invalid?
    assert client.errors[:hcn].any?
	end

	test "client diagnosis can't be blank" do
  	client = Client.new(diagnosis: "")
  	assert client.invalid?
    assert client.errors[:diagnosis].any?
	end

	test "client address can't be blank" do
  	client = Client.new(address: "")
  	assert client.invalid?
    assert client.errors[:address].any?
	end

  test "client HCN should be unique" do 
    client = Client.new(hcn: clients(:one).hcn,
                first_name: "MyString",
                last_name: "MyString",
                date_of_birth: "2013-08-20",
                gender: "Male",
                physician: "MyString",
                physician_phone: "MyString",
                diagnosis: "MyText",
                advanced_directives: "MyText",
                address: "MyString",
                contact_name: "MyString",
                contact_phone: "MyString",
                contact_relationship: "MyString")
    assert client.invalid?
    assert client.errors[:hcn].any?
  end

  test "client HCN must be valid format" do
    client = Client.new(hcn: "hello",
                first_name: "MyString",
                last_name: "MyString",
                date_of_birth: "2013-08-20",
                gender: "Male",
                physician: "MyString",
                physician_phone: "MyString",
                diagnosis: "MyText",
                advanced_directives: "MyText",
                address: "MyString",
                contact_name: "MyString",
                contact_phone: "MyString",
                contact_relationship: "MyString")
    assert client.invalid?
    assert client.errors[:hcn].any?
  end

end
