require 'test_helper'

class Admin::AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_admin_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_admin_create_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_admin_destroy_url
    assert_response :success
  end

end
