require 'test_helper'

class V1::ContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contact = contacts(:two)
  end

  test "should get index" do
    get v1_contacts_url
    contacts = JSON.parse(@response.body)
    # puts("1 = #{contacts.last["first_name"]}")
    # puts("#{@contact.first_name}")
    assert_response :success
    assert contacts.last["first_name"] == @contact.first_name
  end

  test "should create contact" do
    assert_difference('Contact.count') do
      post v1_contacts_url, params: { contact: { first_name: @contact.first_name, last_name: @contact.last_name, email: @contact.email } }
    end

    assert_response :created
  end

  test "should show contact" do
    get v1_contact_url("#{@contact.id}")
    contact = JSON.parse(@response.body)
    # puts("contact = #{contact.first["id"]}")
    # puts("@contact = #{@contact.id}")
    assert_response :success
    assert contact.first["id"] == @contact.id
  end

  test "should destroy contact" do
    assert_difference('Contact.count', -1) do
      delete v1_contact_url("#{@contact.id}")
      # contact = JSON.parse(@response.body)
      # puts("contact = #{@head}")
    end

    assert_response :success
  end

end
