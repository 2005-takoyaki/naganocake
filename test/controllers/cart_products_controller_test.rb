require 'test_helper'

class CartProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get add" do
    get cart_products_add_url
    assert_response :success
  end

  test "should get index" do
    get cart_products_index_url
    assert_response :success
  end

  test "should get destroy" do
    get cart_products_destroy_url
    assert_response :success
  end

  test "should get destroy_all" do
    get cart_products_destroy_all_url
    assert_response :success
  end

  test "should get update" do
    get cart_products_update_url
    assert_response :success
  end

end
