require 'test_helper'

class Public::CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_customers_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_customers_edit_url
    assert_response :success
  end

  test "should get update" do
    get public_customers_update_url
    assert_response :success
  end

  test "should get active_confirm" do
    get public_customers_active_confirm_url
    assert_response :success
  end

  test "should get not_active" do
    get public_customers_not_active_url
    assert_response :success
  end

end
