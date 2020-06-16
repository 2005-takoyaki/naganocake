require 'test_helper'

class Admin::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_orders_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_orders_show_url
    assert_response :success
  end

  test "should get update" do
    get admin_orders_update_url
    assert_response :success
  end

  test "should get products_update" do
    get admin_orders_products_update_url
    assert_response :success
  end

end
